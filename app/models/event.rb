class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos

  validates :title, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :datetime, presence: true
  validates :datetime, inclusion: {in: Date.current.. }
  validates :datetime, inclusion: {in: Time.now.. }

  scope :persisted, -> { where 'id IS NOT NULL' }

  def visitors
    (subscribers + [user]).uniq
  end
end
