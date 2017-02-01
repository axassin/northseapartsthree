class Enterprise::HumanResources::EmployeeAccountsManagementController < GenericDashboardController

  layout 'dashboard/main'

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_employee_accounts_management_path,
                     @@routes.enterprise_human_resources_path)

    current_branch = params[:branch] || Branch.ids.sample(1)
    employment_status = params[:employment_status] || 'ACTIVE'

    @employee_set = Employee.active_branches(current_branch, employment_status)

  end

  def index

  end

end
