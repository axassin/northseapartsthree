source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Windows workaround for coffeescripting
gem 'coffee-script-source', '1.8.0'
# For Bootstrap JS Runtime; See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer'
# gem 'execjs'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'better_errors'

  # rspec-rails is a testing framework for Rails 3.x, 4.x and 5.0.
  gem 'rspec-rails', '~> 3.5'

  # factory_girl is a fixtures replacement with a straightforward definition syntax, support for multiple build
  # strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects), and support for
  # multiple factories for the same class (user, admin_user, and so on), including factory inheritance.
  gem 'factory_girl'

  #Capybara helps you test web applications by simulating how a real user would interact with your app.
  gem 'capybara'

end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'

  # Guard is a command line tool to easily handle events on file system modifications.
  gem 'guard', '>= 2.2.2', :require => false
  gem 'guard-livereload',  :require => false
  gem 'rack-livereload'
  gem 'rb-fsevent',        :require => false

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Slim is a fast, lightweight templating engine
gem 'slim'
# HTML, CSS, and JS framework for developing responsive, mobile first projects on the web
gem 'bootstrap', '~> 4.0.0.alpha3.1'
# Tooltips and popovers depend on tether for positioning. If you use them, add tether to the Gemfile:
gem 'rails-assets-tether', '>= 1.1.0'

# UUID generator for producing universally unique identifiers based on RFC 4122
gem 'uuidtools'

# This gem is a port of Perl's Data::Faker library that generates fake data.
gem 'faker'

#  provides a simple and extremely flexible way to upload files from Ruby applications
gem 'carrierwave', '>= 1.0.0.beta', '< 2.0'

# Probability gives you an easy way to perform code only every so often, based on your input.
gem 'probability'

# DRY (Don't Repeat Yourself) of require 'spec_helper'.
gem 'dry_require_spec_helper'