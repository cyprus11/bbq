class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILJET_DEFAULT_FROM']
  layout 'mailer'
end
