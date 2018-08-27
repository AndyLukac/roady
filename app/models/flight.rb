class Flight < JourneyItem

  validates :arrival_date, presence: true
  validates :arrival_place, presence: true
  validates :departure_date, presence: true
  validates :departure_place, presence: true
  validates :reservation_number, presence: true
  validates :flight_number, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

end
