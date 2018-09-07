class Accommodation < JourneyItem
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :image, presence: true
  validates :owner, presence: true
  validates :address, presence: true
  validates :guests, presence: true
  validates :price, presence: true
  validates :arrival_date, presence: true
  validates :departure_date, presence: true
  validates :reservation_number, presence: true
  validates :telephone, presence: true

  def geocode_place_adresses
  end
end
