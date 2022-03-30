source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'rails', '~> 6.0.0.rc1'
gem 'jwt', '~> 2.1'
gem 'bcrypt', '~> 3.1.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'webpacker', '>= 4.0.x'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.4.0', require: false
gem 'sidekiq', '~> 5.2', '>= 5.2.5'
gem 'redis', '~> 4.0'

group :development, :test do
  gem 'dotenv-rails', '~> 2.7'
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug', '~> 3.7'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 3.8'
  gem 'database_cleaner', '~> 1.7'
  gem 'rspec-json_expectations', '~> 2.1'
end

group :development do
  gem 'web-console', github: 'rails/web-console'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara-selenium', '~> 0.0.6'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
  gem 'shoulda-matchers', '~> 4.1.2'
  gem 'simplecov', '~> 0.16.1', require: false
  gem 'timecop', '~> 0.9.1'
  gem 'webmock', '~> 3.5', '>= 3.5.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
