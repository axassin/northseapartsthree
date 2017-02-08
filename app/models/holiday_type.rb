class HolidayType < ApplicationRecord

  include GenericResourceCommon
  include Remark

  setup_model('fa-bitbucket',
              'name',
              @@routes.enterprise_human_resources_payroll_holiday_types_path,
              Enterprise::HumanResources::Payroll::HolidayTypesController )

end
