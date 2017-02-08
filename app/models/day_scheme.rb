class DayScheme < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include ImplementedAt
  validates :implemented_at, presence: true

  setup_model('fa-superpowers',
              'type_name',
              @@routes.enterprise_human_resources_payroll_day_schemes_path,
              Enterprise::HumanResources::Payroll::DaySchemesController )

end
