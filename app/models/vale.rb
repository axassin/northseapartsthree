class Vale < ApplicationRecord

  include GenericResourceCommon
  setup_model('info',
              'amount',
              @@routes.enterprise_human_resources_payroll_vales_management_vales_path,
              Enterprise::HumanResources::Payroll::ValesManagement::ValesController )

  include Remark
  include AssociatedEmployee

  def get_balance

  end

  monetize :amount_centavos, with_model_currency: :currency

end
