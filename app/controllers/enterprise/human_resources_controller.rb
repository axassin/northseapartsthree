class Enterprise::HumanResourcesController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_human_resources_path,
                     @@routes.enterprise_path)

  end

  def index

  end

end
