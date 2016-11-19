class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :setup_controller

  include GenericResource
  @@routes = Rails.application.routes.url_helpers

  # setups variables needed for the controller
=begin
  def setup_resource_controller( class_model,
                                 resource_glyphicon,
                                 resource_title_heading,
                                 resource_sub_heading,
                                 main_resource_path,
                                 omitted_attributes,
                                 admitted_attributes)

    @@class_model = class_model
    @@resource_glyphicon = resource_glyphicon
    @@resource_title_heading = resource_title_heading
    @@resource_sub_heading = resource_sub_heading
    @@main_resource_path = main_resource_path
    @@omitted_attributes = omitted_attributes
    @@admitted_attributes = admitted_attributes
  end
=end

end