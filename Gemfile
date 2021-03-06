source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'font-awesome-sass', '~> 5.15.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Devise
gem 'devise', '>= 4.6'
gem 'activeadmin'

gem 'acts_as_votable'
gem 'public_activity'
gem 'carrierwave', '~> 1.3'
gem 'bootstrap', '>= 4.3.1'
gem 'jquery-rails'
gem 'simple_calendar', '~> 2.0'
gem 'redcarpet', '~> 2.3.0'
gem 'coderay'
gem "mini_magick", ">= 4.9.4"
gem "fog-aws"
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'rubocop'
gem 'rubocop-performance'
gem 'devise_invitable', '~> 2.0.0'
gem 'pundit'
gem 'ransack'
gem 'rmagick'
gem "yard", ">= 0.9.20"
gem "bootstrap4-datetime-picker-rails"
gem 'react_on_rails'
gem 'react-rails'
gem 'acts_as_tenant'
gem 'sidekiq'
gem 'sinatra', require: false # ダッシュボードを利用するため
gem 'webpacker', '~> 5.x'
gem "haml-rails"
gem 'stripe'

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.6'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'rails-erd'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'rspec-rails', '~> 4.0.0'
  gem "factory_bot_rails"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
