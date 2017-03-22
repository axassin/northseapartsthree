class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Rails.application.routes.url_helpers
  @@routes = Rails.application.routes.url_helpers

  cattr_accessor :current
  before_filter { ApplicationController.current = self }
  after_filter  { ApplicationController.current = nil  }

end