class Enterprise::HumanResources::EmployeeAccountsManagement::BiodataController < GenericResourceController

  def setup_controller
    setup_variables( Biodata,
                     'Biodata',
                     'Personal Details',
                     ['system_account_id'],
                     ['account_name'],
                     @@routes.enterprise_human_resources_employee_accounts_management_path)
  end

  def process_form(my_employee, current_params, wizard_mode = nil)

    employee_processing = Proc.new do
      my_employee.system_account_id = current_params[:system_account_id]
      my_employee.save!
    end

    setup_process(my_employee, employee_processing, wizard_mode)
  end

end
