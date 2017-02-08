class Holiday < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include ImplementedAt
  validates :implemented_at, presence: true, uniqueness: true

  belongs_to :day_scheme

  setup_model('fa-slack',
              'name',
              @@routes.enterprise_human_resources_attendance_holidays_path,
              Enterprise::HumanResources::Attendance::HolidaysController )

end
