class Enterprise::HumanResources::EmployeeAccountsManagement::EmployeesController < GenericResourceController

  def setup_controller
    setup_variables( Employee,
                     'Employee',
                     'Workforce',
                     ['system_account_id'],
                     ['designation'],
                     @@routes.enterprise_human_resources_employee_accounts_management_path,
                     @@routes.enterprise_human_resources_employee_accounts_management_new_employee_wizard_index_path)
  end

  def process_form(my_employee, current_params, wizard_mode = nil)

    employee_processing = Proc.new do
      my_employee.branch_id = current_params[:branch_id]
      my_employee.position = current_params[:position]
      my_employee.system_account_id = current_params[:system_account_id]
      my_employee.save!
    end

    setup_process(my_employee, employee_processing, wizard_mode)
  end

end
