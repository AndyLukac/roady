class Car < JourneyItem

  validates :arrival_date, presence: true
  validates :arrival_place, presence: true
  validates :departure_date, presence: true
  validates :departure_place, presence: true
  validates :reservation_number, presence: true
  validates :price, presence: true, integer: true
  validates :brand, presence: true
  validates :hiring_days, presence: true

end
