# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# default template for action mailer
ActionMailer::Base.default :content_type => "text/html"
