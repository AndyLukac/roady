class Flight < JourneyItem

  validates :arrival_date, presense: true
  validates :arrival_place, presense: true
  validates :departure_date, presense: true
  validates :departure_place, presense: true
  validates :reservation_number, presense: true
  validates :flight_number, presense: true
  validates :price, presense: true, integer: true

end
