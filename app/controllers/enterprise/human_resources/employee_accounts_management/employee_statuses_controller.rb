class Enterprise::HumanResources::EmployeeAccountsManagement::EmployeeStatusesController < GenericResourceController

  def setup_controller
    setup_variables( EmployeeStatus,
                     'Employee Statuses',
                     'State of Employment',
                     ['employee_id'],
                     ['employee_name'],
                     @@routes.enterprise_human_resources_employee_accounts_management_path)
  end

  def process_form(my_employee_status, current_params, wizard_mode = nil)

    employee_status_processing = Proc.new do
      my_employee_status.employee = Employee.find(current_params[:employee_id])
      my_employee_status.state = current_params[:state]
      my_employee_status.implemented_on = current_params[:implemented_on]
      my_employee_status.save!
    end

    setup_process(my_employee_status, employee_status_processing, wizard_mode)
  end

end
