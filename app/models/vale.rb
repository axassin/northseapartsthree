class Vale < ApplicationRecord

  include GenericResourceCommon
  setup_model('info',
              'amount',
              @@routes.enterprise_human_resources_payroll_vales_management_vales_path,
              Enterprise::HumanResources::Payroll::ValesManagement::ValesController )
  monetize :amount_centavos, with_model_currency: :currency

  include Remark
  include AssociatedEmployee
  

  def self.get_balance

  end

  def self.get_sum(employee_id)
    Vale.where(employee_id: employee_id).sum(:amount_centavos)
  end
end
