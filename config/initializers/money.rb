# config/initializers/money.rb
MoneyRails.configure do |config|

  puts 'SET DEFAULT CURRENCY'

  # set the default currency
  config.default_currency = :php

end