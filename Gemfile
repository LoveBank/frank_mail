source 'https://rubygems.org'
ruby '2.3.0'
gem 'frank', :git => 'git://github.com/LoveBank/frank.git'

gem 'awesome_print'
gem 'rails', "~> 4.2.5"
gem 'pg'
gem 'postmark-rails', '~> 0.12.0'
gem 'newrelic_rpm'
gem 'responders'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'letter_opener'
  gem 'capybara'
  gem 'guard-rspec', require: false
end

gem 'web-console', group: :development

group :production do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
end
