class RestDay < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include Remark

  setup_model('fa-eject',
              'day',
              @@routes.enterprise_human_resources_attendance_rest_days_path,
              Enterprise::HumanResources::Attendance::RestDaysController )

  belongs_to :employee

end
