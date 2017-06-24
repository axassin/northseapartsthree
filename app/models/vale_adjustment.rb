class ValeAdjustment < ApplicationRecord

  include AssociatedEmployee
  include GenericResourceCommon

  monetize :amount_centavos, with_model_currency: :currency
  
  setup_model('amount',
              @@routes.enterprise_human_resources_payroll_vales_management_vale_adjustments_path,
              Enterprise::HumanResources::Payroll::ValesManagement::ValeAdjustmentsController )

end
