source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'devise', '~> 4.7'
gem 'rails-i18n', '~> 6.0.0'
gem 'carrierwave', '~> 2.0'
gem 'foreman'
gem 'mailjet'
gem 'delayed_job_active_record'
gem 'devise-i18n'
gem 'rmagick'
gem 'fog-aws'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry'
end

group :development do
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-bundler', '~> 2.0'
end

group :production do
  gem 'pg'
end
