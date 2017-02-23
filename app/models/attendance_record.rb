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


  def self.point_hour(point_date, point_time_hour)
    AttendanceRecord.where(implemented_at: point_date).each do |attendance_record|

    end
  end

end
