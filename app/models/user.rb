class User < ApplicationRecord
  EMAIL_REGEX = /\A[a-z0-9\_]+\.?[a-z0-9\_.]+@[a-z0-9\.]+\.[a-z]+\z/

  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true, format: EMAIL_REGEX
end
