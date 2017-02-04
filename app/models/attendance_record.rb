class AttendanceRecord < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee

  setup_model('fa-clock-o',
              'date_of_attendance',
              @@routes.enterprise_human_resources_attendance_attendance_records_path,
              Enterprise::HumanResources::Attendance::AttendanceRecordsController )

  belongs_to :employee

  validates :date_of_attendance, presence: true
  validates :time_in, presence: true
  validates :time_out, presence: true
  validate :time_precedence
  validate :overlap

  def time_precedence
=begin
    puts '-------- comparing time precendence -------------'
    puts 'time_in: ' + time_in.to_s
    puts 'time_out: ' + time_out.to_s
    puts 'result: ' + (time_in >= time_out).to_s
    puts '-------------------------------------------------'
=end

    if time_in >= time_out
      errors.add(:time_in, 'Time In must be before Time Out')
    end
  end

  def overlap
    current_date_time_in = DateTime.new(date_of_attendance.year, date_of_attendance.month, date_of_attendance.day, time_in.hour, time_in.min, time_in.sec )
    current_date_time_out = DateTime.new(date_of_attendance.year, date_of_attendance.month, date_of_attendance.day, time_out.hour, time_out.min, time_out.sec )
    AttendanceRecord.all.where(employee_id: employee_id).each do |att_rec|
      other_date_time_in = DateTime.new(att_rec.date_of_attendance.year, att_rec.date_of_attendance.month, att_rec.date_of_attendance.day, att_rec.time_in.hour, att_rec.time_in.min, att_rec.time_in.sec )
      other_date_time_out = DateTime.new(att_rec.date_of_attendance.year, att_rec.date_of_attendance.month, att_rec.date_of_attendance.day, att_rec.time_out.hour, att_rec.time_out.min, att_rec.time_out.sec )

      assessment = (((current_date_time_in..current_date_time_out).overlaps?(other_date_time_in..other_date_time_out)) && ( id != att_rec.id))
      if assessment
        puts '--------------- checking overlap --------------'
        puts 'current_date_time_in : ' + current_date_time_in.to_s
        puts 'current_date_time_out : ' + current_date_time_out.to_s
        puts 'other_date_time_in : ' + other_date_time_in.to_s
        puts 'other_date_time_out : ' + other_date_time_out.to_s
        puts 'belonging to: ' + att_rec.employee.system_account.name
        puts '--------------- ---------------- --------------'
        errors.add(:date_of_attendance, 'Overlap with current Date')
      end

    end
  end

  searchable_date(:date_of_attendance)
  searchable_date(:time_in)
  searchable_date(:time_out)

  searchable_string(:date_of_attendance)
  searchable_string(:time_in)
  searchable_string(:time_out)



end
