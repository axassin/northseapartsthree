class AttendanceRecord < ApplicationRecord

  include GenericResourceCommon
  include EmployeeAssociated

  setup_model('fa-clock-o',
              'date_of_attendance',
              @@routes.enterprise_human_resources_attendance_attendance_records_path,
              Enterprise::HumanResources::Attendance::AttendanceRecordsController )

  belongs_to :employee

  validates :date_of_attendance, presence: true
  validates :time_in, presence: true
  validates :time_out, presence: true
  validate :time_precedence
  validate :no_overlap

  def time_precedence
    if time_in >= time_out
      errors.add(:time_in, 'Time In must be before Time Out')
      errors.add(:time_out, 'Time In must be before Time Out')
    end
  end

  def no_overlap

  end

  searchable_string(:date_of_attendance)
  searchable_string(:time_in)
  searchable_string(:time_out)



end
