# ------------------
# Generic Report is a controller for showing information given a set of params
# ------------------

class GenericReportController < ApplicationController

  layout 'report/main'

  before_action :setup_controller
  before_action :authenticate_user!

  def setup_variables(main_resource_path, parent_controller_path, title_heading = 'Generic Report')
    @main_resource_path = main_resource_path
    @parent_controller_path = parent_controller_path
    @title_heading = title_heading.upcase
  end

end
