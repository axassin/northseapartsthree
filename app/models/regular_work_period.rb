class RegularWorkPeriod < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include TimePrecedence
  include TimeOverlap
  include Remark

  setup_model('fa-play',
              'work_period',
              @@routes.enterprise_human_resources_attendance_regular_work_periods_path,
              Enterprise::HumanResources::Attendance::RegularWorkPeriodsController )

  def work_period
    time_in.to_s + ' to ' + time_out.to_s
  end

end
