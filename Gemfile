source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'devise', '~> 4.7'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry'
end

group :production do
  gem 'pg'
end
