class Holiday < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include ImplementedAt

  belongs_to :day_scheme

  validates_presence_of :day_scheme
  validates_presence_of :name
  validates :implemented_at, presence: true, uniqueness: true

  setup_model('fa-slack',
              'name',
              @@routes.enterprise_human_resources_attendance_holidays_path,
              Enterprise::HumanResources::Attendance::HolidaysController )

  searchable_string(:name)
  searchable_string(:associated_day_scheme)

  def associated_day_scheme
    DayScheme.find_by_id(day_scheme_id).represent
  end

end
