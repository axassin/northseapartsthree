class Enterprise::HumanResources::EmployeeAccountsManagementController < GenericDashboardController

  layout 'dashboard/main'

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_employee_accounts_management_path,
                     @@routes.enterprise_human_resources_path)

    current_branch = params[:branch] || Branch.ids.sample(1)
    current_state = params[:current_state] || 'ACTIVE'

    @employee_set = Employee.active_branches(current_branch, current_state)

  end

  def index

  end

end
