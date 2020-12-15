Mailjet.configure do |config|
  config.api_key = ENV["MAILJET_SMTP_LOGIN"]
  config.secret_key = ENV["MAILJET_SMTP_PASSWORD"]
  config.api_version = "v3.1"
end
