class Enterprise::HumanResources::Payroll::ValesManagement::ValesController < GenericResourceController

  def setup_controller
    setup_variables( Vale,
                     'Vales',
                     'Advanced Payment to Employee',
                     ['employee_id'],
                     ['employee_name'],
                     @@routes.enterprise_human_resources_payroll_vales_management_vales_path)
  end


   def process_form(my_vale, current_params, wizard_mode = nil)

    my_vale_processing = Proc.new do   
      my_vale.employee = Employee.find(current_params[:employee_id])
      my_vale.implemented_on = current_params[:implemented_on]
      process_money(my_vale_adjustment, current_params[:amount], current_params[:currency])
      my_vale.save!
    end

    setup_process(my_vale, my_vale_processing, wizard_mode)
  end

end
