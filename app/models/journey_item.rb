class JourneyItem < ApplicationRecord
  belongs_to :journey

  geocoded_by :geocode_place_adresses
  after_validation :geocode, if: :will_save_change_to_address?

  def geocode_place_adresses
    departure_coordinates = Geocoder.search(departure_place)
    arrival_coordinates = Geocoder.search(arrival_place)

    self.departure_longitude = departure_coordinates.latitude
    self.arrival_longitude = arrival_coordinates.longitude

    self.departure_latitude = departure_coordinates.latitude
    self.arrival_longitude = arrival_coordinates.longitude
  end

end
