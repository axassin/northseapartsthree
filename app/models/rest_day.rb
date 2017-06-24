class RestDay < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include Remark
  include ImplementedOn

  scope :current_rest_day, -> (employee_id, inquired_date) { where(['implemented_on <= ? AND employee_id = ?', inquired_date, employee_id]).order('implemented_on DESC').first.day }

  setup_model('day',
              @@routes.enterprise_human_resources_attendance_rest_days_path,
              Enterprise::HumanResources::Attendance::RestDaysController )

  validates :day, length: { in: 0..64 }, inclusion: {in: ['MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY']}, :allow_nil => false

  searchable_string(:day)

end
