class Enterprise::HumanResources::PayrollController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_payroll_path,
                     @@routes.enterprise_human_resources_path)

  end

  def index

  end

end
