class Enterprise::HumanResources::EmployeeAccountsManagementController < GenericDashboardController

  layout 'dashboard/main'

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_employee_accounts_management_path,
                     @@routes.enterprise_human_resources_path)
  end

  def index

  end

end
