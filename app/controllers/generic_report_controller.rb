class GenericReportController < ApplicationController

  layout 'report/main'

  before_action :setup_controller

  def setup_variables(main_resource_path, parent_controller_path)
    @main_resource_path = main_resource_path
    @parent_controller_path = parent_controller_path
  end

end
