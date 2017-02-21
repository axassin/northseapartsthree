class RestDay < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include Remark
  include ImplementedAt

  setup_model('eject',
              'day',
              @@routes.enterprise_human_resources_attendance_rest_days_path,
              Enterprise::HumanResources::Attendance::RestDaysController )

  validates :day, length: { in: 0..64 }, inclusion: {in: ['MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY']}, :allow_nil => false
  validates :day, uniqueness: { scope: [:employee_id, :implemented_at] }

  searchable_string(:day)

end
