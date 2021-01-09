class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  validates :photo, presence: true, length: { minimum: 5 }

  scope :persisted, -> { where 'id IS NOT NULL' }
end
