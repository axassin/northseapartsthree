class Enterprise::HumanResources::Payroll::ValesManagement::ValesController < GenericResourceController

  def setup_controller
    setup_variables( Vale,
                     'Vales',
                     'Advanced Payment to Employee',
                     ['employee_id'],
                     ['employee_name'],
                     @@routes.enterprise_human_resources_payroll_vales_management_vales_path)
  end



end
