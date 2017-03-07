class Employee < ApplicationRecord

  include GenericResourceCommon

  setup_model('black-tie',
              'designation',
              @@routes.enterprise_human_resources_employee_accounts_management_employees_path,
              Enterprise::HumanResources::EmployeeAccountsManagement::EmployeesController)

  belongs_to :branch
  belongs_to :system_account

  has_one :biodatum, :dependent => :destroy
  has_many :regular_work_periods, :dependent => :destroy
  has_many :employee_statuses, :dependent => :destroy
  has_many :associated_files, as: :fileable, :dependent => :destroy
  has_many :associated_images, as: :imageable, :dependent => :destroy
  has_many :rest_days

  validates_presence_of :branch
  validates_presence_of :system_account
  validates_uniqueness_of :system_account
  validates :branch, length: { in: 0..64 }, :allow_nil => true

  scope :active_branches, -> (branch_id, status) { where(['branch_id = ?', branch_id]).select { |employee| employee.employment_status == status }}

  def designation
    SystemAccount.find_by_id(system_account_id).name + ' (' + position + ') at ' + Branch.find_by_id(branch_id).name
  end

  def account_name
    SystemAccount.find_by_id(system_account_id).name
  end

  def mother_branch
    Branch.find_by_id(branch_id).represent
  end

  def employment_status(inquired_date = Date.today)
    employee_status = EmployeeStatus.where(['implemented_on <= ? AND employee_id = ?', inquired_date, id])
    employee_status.order('implemented_on DESC').first.state.to_s if employee_status.present?
  end

  # outputs if employee has incurred overtime, undertime, exact time, shifted time on said date
  def attendance_status(inquired_date = Date.today)

    # extract attendance records
    attendance_records =  AttendanceRecord.where(['implemented_on = ? AND employee_id = ?', inquired_date, id])
    date_difference = SystemConstant.extract_constant(inquired_date, 'hr.allowable_work_hours_per_day')

    # see if record exists
    if attendance_records.count > 0

      # set variables
      daily_emp_work_hours = 0
      current_work_period = RegularWorkPeriod.current_work_period(inquired_date, id)
      reg_work_hours = current_work_period.number_of_hours
      work_period_time_in = current_work_period.time_in
      work_period_time_out = current_work_period.time_out

      # count hours worked per day
      attendance_records.each do |record|
        att_rec_time_in = record.time_in
        att_rec_time_out = record.time_out
        daily_emp_work_hours = daily_emp_work_hours + ((att_rec_time_out - att_rec_time_in)/3600)
      end

      puts '-----------------------'
      puts inquired_date
      puts account_name
      puts daily_emp_work_hours
      puts reg_work_hours

      if daily_emp_work_hours == reg_work_hours

        all_time_in = []
        all_time_out = []

        attendance_records.each do |record|
          all_time_in.push(record.time_in)
          all_time_out.push(record.time_out)
        end

        min_time_in = all_time_in.min
        max_time_out = all_time_out.max

        if ((min_time_in == work_period_time_in) && (max_time_out == work_period_time_out))
          'exact'
        else
          'shifted'
        end

      elsif daily_emp_work_hours > reg_work_hours
        'overtime'
      elsif daily_emp_work_hours < reg_work_hours
        'undertime'
      end

    else
      'no_record'
    end

  end

  searchable_string(:account_name)
  searchable_string(:mother_branch)
  searchable_string(:position)

end
