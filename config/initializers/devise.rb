Devise.setup do |config|
  config.mailer_sender = Rails.application.credentials.mailjet[:mailjet_default_from]

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.allow_unconfirmed_access_for = 2.days
  config.reconfirmable = false
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.omniauth :facebook, Rails.application.credentials.facebook[:app_id],
                  Rails.application.credentials.facebook[:app_secret_key],
                  display: "popup"
  config.omniauth :vkontakte, Rails.application.credentials.vkontakte[:app_id],
                  Rails.application.credentials.vkontakte[:app_secret_key],
                  scope: 'email,photos',
                  display: 'popup',
                  lang: 'en',
                  https: 1,
                  image_size: 'original'
end
