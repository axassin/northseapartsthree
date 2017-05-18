class EnterpriseController < GenericReportController

  before_action :authenticate_user!

  def setup_controller
    setup_variables( @@routes.enterprise_path,
                     @@routes.root_path)

  end

  def index

  end

end
