class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include GenericResource
  @@routes = Rails.application.routes.url_helpers

end