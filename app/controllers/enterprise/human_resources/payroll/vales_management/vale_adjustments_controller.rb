class Enterprise::HumanResources::Payroll::ValesManagement::ValeAdjustmentsController  < GenericResourceController

  def setup_controller
    setup_variables( ValeAdjustment,
                     'Vale Adjustments',
                     'Adjust Advanced Payment to Employee',
                     ['employee_id'],
                     ['employee_name'],
                     @@routes.enterprise_human_resources_payroll_vales_management_vale_adjustments_path)
  end

   def process_form(my_vale_adjustment, current_params, wizard_mode = nil)

    my_vale_adjustment_processing = Proc.new do   
      my_vale_adjustment.employee = Employee.find(current_params[:employee_id])
      process_money(my_vale_adjustment, current_params[:amount], current_params[:currency])
      my_vale_adjustment.transaction_type = current_params[:transaction_type]
      my_vale_adjustment.implemented_on = current_params[:implemented_on]
      my_vale_adjustment.save!
    end

    setup_process(my_vale_adjustment, my_vale_adjustment_processing, wizard_mode)
  end
end
