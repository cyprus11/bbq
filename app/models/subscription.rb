class Subscription < ApplicationRecord
  EMAIL_REGEX = /\A[a-z0-9\_]+\.?[a-z0-9\_.]+@[a-z0-9\.]+\.[a-z]+\z/

  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: :user_present?
  validates :user_email, presence: true, format: { with: EMAIL_REGEX }, unless: :user_present?
  validates :user, uniqueness: { scope: :event_id }, if: :user_present?
  validates :user, exclusion: { in: :event_user }, if: :user_present?
  validates :user_email, uniqueness: { scope: :event_id }, unless: :user_present?

  def user_name
    return user.name if user.present?

    super
  end

  def user_email
    return user.email if user.present?

    super
  end

  private
  def user_present?
    user.present?
  end

  def event_user
    [event.user]
  end
end
