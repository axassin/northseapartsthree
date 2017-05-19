class GenericDashboardController < ApplicationController

  layout 'report/main'

  before_action :setup_controller
  before_action :authenticate_user!

  def setup_variables(main_resource_path, parent_controller_path, title_heading = 'generic_field')
    @main_resource_path = main_resource_path
    @parent_controller_path = parent_controller_path
    @title_heading = title_heading.upcase
  end

end
