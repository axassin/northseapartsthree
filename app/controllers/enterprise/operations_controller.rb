class Enterprise::OperationsController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_operations_path,
                     @@routes.enterprise_path)
  end

  def index

  end

end
