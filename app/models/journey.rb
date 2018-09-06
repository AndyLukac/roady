class Journey < ApplicationRecord
  belongs_to :user
  has_many :accommodations
  has_many :flights
  has_many :trains
  has_many :cars
  has_many :notifications

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
