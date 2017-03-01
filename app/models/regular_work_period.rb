class RegularWorkPeriod < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include TimeOverlap
  include Remark
  include ImplementedAt
  include TimePrecedence

  validate :exact_work_period
  validates :one_hour_break, inclusion: {in: [true,false]}

  setup_model('play',
              'work_period',
              @@routes.enterprise_human_resources_attendance_regular_work_periods_path,
              Enterprise::HumanResources::Attendance::RegularWorkPeriodsController )

  def work_period
    time_in.strftime('%R') + ' to ' + time_out.strftime('%R')
  end

  def exact_work_period
    allowable_work_hours_per_day = (SystemConstant.extract_constant(implemented_at, 'hr.allowable_work_hours_per_day')).to_f
    temp_work_hours_per_day = number_of_hours

    unless allowable_work_hours_per_day == temp_work_hours_per_day
      errors.add(:time_out, 'Allowable Work Hours per Day does not match Proposed Work Hours')
    end

  end

  def self.current_work_period(inquired_date = Date.today, employee_id)
    regular_work_period = RegularWorkPeriod.where(['implemented_at <= ? AND employee_id = ?', inquired_date, employee_id])
    regular_work_period.order('implemented_at DESC').first if regular_work_period.present?
  end

  def number_of_hours
    temp_work_hours_per_day = ''
    if one_hour_break
      (temp_work_hours_per_day = (time_out - time_in - 1.hour)/3600)
    else
      temp_work_hours_per_day = (time_out - time_in)/3600
    end
    temp_work_hours_per_day
  end

end
