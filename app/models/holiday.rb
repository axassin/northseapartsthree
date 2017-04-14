class Holiday < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include ImplementedOn

  belongs_to :day_scheme

  validates_presence_of :day_scheme
  validates_presence_of :name
  validates :implemented_on, presence: true, uniqueness: true

  scope :get_holiday, -> (given_date) { where('implemented_on = ?', given_date) }

  setup_model('slack',
              'name',
              @@routes.enterprise_human_resources_attendance_holidays_path,
              Enterprise::HumanResources::Attendance::HolidaysController )

  searchable_string(:name)
  searchable_string(:associated_day_scheme)

  def associated_day_scheme
    DayScheme.find_by_id(day_scheme_id).represent
  end

end
