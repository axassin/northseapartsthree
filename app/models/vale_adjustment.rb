class ValeAdjustment < ApplicationRecord

  include AssociatedEmployee
  include GenericResourceCommon

  monetize :amount_centavos, with_model_currency: :currency
  
  setup_model('info',
              'amount',
              @@routes.enterprise_human_resources_payroll_vales_management_vale_adjustments_path,
              Enterprise::HumanResources::Payroll::ValesManagement::ValeAdjustmentsController )

  def self.get_sum_add(employee_id)
    ValeAdjustment.where(employee_id: employee_id, transaction_type: 'ADDITION').sum(:amount_centavos)
  end
  def self.get_sum_deduct(employee_id)
    ValeAdjustment.where(employee_id: employee_id, transaction_type: 'DEDUCTION').sum(:amount_centavos)
  end
end
