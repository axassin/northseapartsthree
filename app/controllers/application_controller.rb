class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :setup_controller

  include GenericResource
  @@routes = Rails.application.routes.url_helpers

end