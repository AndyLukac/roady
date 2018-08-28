class Journey < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :date, presence: true
end
