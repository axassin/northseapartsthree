class Enterprise::GeneralManagementController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_general_management_path,
                     @@routes.enterprise_path)

  end

  def index

  end

end
