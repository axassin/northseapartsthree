require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Northseapartsthree
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Asia/Hong_Kong'
    config.active_record.default_timezone = :local

    # Automatic Loading for Migration Concerns
    config.autoload_paths += Dir["#{config.root}/db/migrate/concerns/**/"]

    # Automatic Loading for Decorator Concerns
    config.autoload_paths += Dir["#{config.root}/app/decorators/concerns/**/"]
    config.assets.enabled = true
  end
end
