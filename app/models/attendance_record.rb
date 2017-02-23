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


  def self.point_hour(point_date, point_hour, employee_id)
    time_hit = 'n.a.'
    AttendanceRecord.where(implemented_at: point_date, employee_id: employee_id).each do |attendance_record|
      time_in = attendance_record.time_in
      time_out = attendance_record.time_out
      if time_in.between?(point_hour, point_hour + 1.hour)
        time_hit = time_in
      elsif time_out.between?(point_hour, point_hour + 1.hour)
        time_hit = time_out
      end
      puts time_in
      puts point_hour
      puts '-------------'
    end
    time_hit
  end

end
