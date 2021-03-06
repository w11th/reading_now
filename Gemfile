source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'

gem 'puma', '~> 3.7'

gem 'devise'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'

gem 'jbuilder', '~> 2.5'

gem 'webpacker'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'

gem 'carrierwave'
gem 'carrierwave-aliyun'

gem 'sidekiq'

# gem 'acts-as-taggable-on', '~> 4.0'

gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'
gem 'redis-rack-cache'

group :development, :test do
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'rb-fsevent', '0.9.8'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-rails'

  gem 'better_errors'

  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma'
  gem 'capistrano-yarn'

  gem 'rails_best_practices'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
