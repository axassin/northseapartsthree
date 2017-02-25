class AttendanceRecord < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include TimePrecedence
  include TimeOverlap
  include ImplementedAt

  setup_model('clock-o',
              'implemented_at',
              @@routes.enterprise_human_resources_attendance_attendance_records_path,
              Enterprise::HumanResources::Attendance::AttendanceRecordsController )

  def attendance_period
    time_in.strftime('%T') + ' to ' + time_out.strftime('%T')
  end

  def self.remarks_of_day(employee_id, implemented_at)
    remark = ''
    counter = 0
    AttendanceRecord.where(employee_id: employee_id, implemented_at: implemented_at)
  end

end
