class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :vkontakte]
  has_many :events, dependent: :destroy
  has_many :comments
  has_many :subscriptions

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.find_for_oauth(token)
    email = token.info.email
    user = where(email: email).first

    return user unless user.nil?

    provider = token.provider

    if provider == "facebook"
      id = token.extra.raw_info.id
      url = "https://facebook.com/#{id}"
    elsif provider == "vkontakte"
      url = token.info.urls.vkontakte
    end

    name = token.info.name
    image = token.info.image

    where(url: url, provider: provider).first_or_create! do |user|
      user.email = email
      user.name = name
      user.remote_avatar_url = image
      user.password = Devise.friendly_token.first(16)
    end
  end

  private

  def set_name
    self.name = "Пользователь #{rand(999)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: email).update_all(user_id: id)
  end
end
