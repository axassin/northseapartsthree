class DevelopmentController < GenericReportController

  def setup_controller
    setup_variables( @@routes.development_path,
                     @@routes.root_path)

  end

  def index

  end

end
