class Journey < ApplicationRecord
  belongs_to :user
  has_many :accommodations
  has_many :flights
  has_many :trains
  has_many :cars

  validates :name, presence: true
  validates :date, presence: true
end
