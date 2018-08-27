class Accommodation < JourneyItem

  validates :name, presence: true
  validates :owner, presence: true
  validates :address, presence: true
  validates :guests, presence: true
  validates :price, presence: true
  validates :telephone, presence: true
  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :reservation_number, presence: true

end
