class AttendanceRecord < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include TimePrecedence
  include TimeOverlap

  setup_model('fa-clock-o',
              'current_date',
              @@routes.enterprise_human_resources_attendance_attendance_records_path,
              Enterprise::HumanResources::Attendance::AttendanceRecordsController )

end
