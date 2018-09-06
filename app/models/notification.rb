class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :journey
  validates :message, presence: true
end
