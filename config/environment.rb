# Load the Rails application.
require_relative 'application'

YAML.load_file("#{::Rails.root}/config/env_provider.yml")[::Rails.env].each {|k,v| ENV[k] = v }

# Initialize the Rails application.
Rails.application.initialize!

# Default Currency
Money.default_currency = Money::Currency.new("PHP")