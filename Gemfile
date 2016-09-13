source 'https://rubygems.org'

ruby '2.3.0'

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
gem 'therubyracer', platforms: :ruby
gem 'jbuilder', '~> 2.3'

gem 'pg'
gem 'paperclip', '~> 4.3'

#Audit
gem "audited-activerecord", "~> 4.2"

group :development, :test do
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
