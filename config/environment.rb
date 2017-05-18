
# Load the Rails application.
require_relative 'application'

if Rails.env.production?
  YAML.load_file("#{::Rails.root}/config/env_provider.yml")[::Rails.env].each {|k,v| ENV[k] = v }
end

# Initialize the Rails application.
Rails.application.initialize!

# Default Currency
Money.default_currency = Money::Currency.new("PHP")