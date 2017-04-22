class Enterprise::SystemAdministrationController < GenericReportController

  def setup_controller
    setup_variables( @@routes.enterprise_general_management_path,
                     @@routes.enterprise_path, 'System Administration')

  end

  def index

  end

end