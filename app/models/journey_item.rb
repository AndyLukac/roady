class JourneyItem < ApplicationRecord
  belongs_to :journey

  after_validation :geocode_place_adresses, if: :any_address_changed?

  def any_address_changed?
    departure_place_changed? || arrival_place_changed? || address_changed?
  end

  def geocode_place_adresses
    departure_coordinates = Geocoder.search(departure_place)
    arrival_coordinates = Geocoder.search(arrival_place)

    self.departure_longitude = departure_coordinates.first.longitude
    self.arrival_longitude = arrival_coordinates.first.longitude

    self.departure_latitude = departure_coordinates.first.latitude
    self.arrival_latitude = arrival_coordinates.first.latitude
  end

end
