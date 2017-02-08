class Holiday < ApplicationRecord

  include GenericResourceCommon
  include Remark

  belongs_to :holiday_type

  setup_model('fa-slack',
              'name',
              @@routes.enterprise_human_resources_attendance_holidays_path,
              Enterprise::HumanResources::Attendance::HolidaysController )

end
