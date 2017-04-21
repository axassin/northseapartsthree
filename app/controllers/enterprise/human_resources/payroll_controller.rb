class Enterprise::HumanResources::PayrollController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_payroll_path,
                     @@routes.enterprise_human_resources_path)

  end

  def index

  end

end
