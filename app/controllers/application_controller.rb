class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Rails.application.routes.url_helpers
  @@routes = Rails.application.routes.url_helpers

end