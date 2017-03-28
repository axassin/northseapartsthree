class Enterprise::HumanResources::EmployeeAccountsManagementController < GenericDashboardController

  layout 'dashboard/main'

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_employee_accounts_management_path,
                     @@routes.enterprise_human_resources_path)

    @branch_id = params[:branch_id] || Branch.order("RAND()").first.id
    @employment_status = params[:employment_status] || 'ACTIVE'

    @employee_set = Employee.active_branches(@branch_id, @employment_status)
    @button_set = [[enterprise_human_resources_employee_accounts_management_new_employee_wizard_index_path,'NEW EMPLOYEE WIZARD'],
                   [enterprise_human_resources_employee_accounts_management_employees_path,'EMPLOYEE'],
                   [enterprise_human_resources_employee_accounts_management_biodata_path,'BIODATA'],
                   [enterprise_human_resources_employee_accounts_management_employee_statuses_path,'EMPLOYEE STATUS']]
  end

  def index

  end

end
