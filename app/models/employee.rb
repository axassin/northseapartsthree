class Employee < ApplicationRecord

  include GenericResourceCommon

  setup_model('fa-black-tie',
              'designation',
              @@routes.enterprise_human_resources_employee_accounts_management_employees_path,
              Enterprise::HumanResources::EmployeeAccountsManagement::EmployeesController)

  belongs_to :branch
  belongs_to :system_account

  has_one :biodatum
  has_many :employee_statuses
  has_many :associated_files, as: :fileable
  has_many :associated_images, as: :imageable


  validates_presence_of :branch
  validates_presence_of :system_account
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
    employee_status = EmployeeStatus.where(['implemented_at <= ? AND employee_id = ?', inquired_date, id])
    employee_status.order('implemented_at DESC').first.state.to_s if employee_status.present?
  end

  def attendance_status(inquired_date = Date.today)
=begin
attendance_records =  AttendanceRecord.where(['implemented_at <= ? AND employee_id = ?', inquired_date, id])

if attendance_records.present?
  time_in = attendance_records.order('implemented_at DESC').first.time_in
  work_period_time_in = RegularWorkPeriod.current_work_period(inquired_date, id).time_in
  if time_in = work_period_time_in
    'present'
  end
else
  'no_record'
end
=end
    'fasf'
  end

  searchable_string(:account_name)
  searchable_string(:mother_branch)
  searchable_string(:position)

end
