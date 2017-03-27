class EnterpriseController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_path,
                     @@routes.root_path)

  end

  def index

  end

end
