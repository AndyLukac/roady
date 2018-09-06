class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :notifications
  has_many :unread_notifications, -> { where(read: false) }, class_name: "Notification"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
