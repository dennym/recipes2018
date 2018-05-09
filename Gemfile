source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'


group :development, :test do

  gem 'sqlite3'

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.7'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'ffaker'
  gem 'shoulda-matchers'
end

group :development do

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'
gem 'will_paginate', '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'carrierwave', '~> 1.0'
gem 'fog'


gem 'tzinfo-data'
