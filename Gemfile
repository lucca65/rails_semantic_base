source 'https://rubygems.org'

ruby '2.2.3'

# Base
gem 'rails', '4.2.4'
gem 'devise'
gem 'kaminari'
gem 'cancancan', '~> 1.10.1'
gem 'ransack'

# External frontend libraries
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'semantic-datepicker-rails', git: 'https://github.com/jonatandahora/semantic-datepicker-rails'
gem 'maskmoney-rails'
gem 'font-awesome-sass'

# Haml & Assets Compilers
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'

gem 'mysql'
gem 'mysql2'
gem 'foreigner'

gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'thin'
end

group :production do
  gem 'puma'
  gem 'unicorn'
end
