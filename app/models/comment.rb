class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :body, presence: true
  validates :user_name, presence: true, unless: :user_present?

  def user_name
    return user.name if user.present?

    super
  end

  private
  def user_present?
    user.present?
  end
end
