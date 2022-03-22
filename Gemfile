source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'devise', :git => "https://github.com/heartcombo/devise.git", ref: '8bb358cf80a632d3232c3f548ce7b95fd94b6eb2'
gem 'rails-i18n', '~> 6.0.0'
gem 'carrierwave', '~> 2.0'
gem 'foreman'
gem 'pundit'
gem 'mailjet'
gem 'delayed_job_active_record'
gem 'devise-i18n'
gem 'rmagick'
gem 'fog-aws'
gem 'resque'
gem 'resque-scheduler'
gem 'omniauth'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
gem 'ed25519',  '>= 1.2', '< 2.0'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry'
  gem 'rspec-rails', '~> 4.0.2'
end

group :development do
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-bundler', '~> 2.0'
  gem "capistrano-resque", "~> 0.2.3", require: false
  gem 'letter_opener'
end

group :production do
  gem 'pg'
end
