class Enterprise::HumanResources::EmployeesController < GenericResourceController

  def setup_controller
    setup_variables( Employee,
                     'Employee',
                     'Workforce',
                     ['system_account_id'],
                     ['account_name'],
                     @@routes.enterprise_human_resoures_path)
  end

  def process_form(my_employee, current_params, wizard_mode = nil)

    employee_processing = Proc.new do
      my_system_constant.label = current_params[:label]
      my_system_constant.category_type = current_params[:category_type]
      my_system_constant.value = current_params[:value]
      my_system_constant.save!
    end

    setup_process(my_employee, employee_processing, wizard_mode)
  end

end
