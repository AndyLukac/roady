class Flight < JourneyItem

  # validates :go_arrival_date, presence: true
  # validates :go_departure_date, presence: true
  # validates :reservation_number, presence: true
  # validates :return_arrival_date, presence: true
  # validates :return_departure_date, presence: true
  # validates :price, presence: true
  # validates :go_flight_number, presence: true
  # validates :return_flight_number, presence: true

  after_validation :fake_date_to_demoday

  private

  def fake_date_to_demoday
    self.departure_date = "2018-10-01 21:35:00".to_datetime if "2018-04-22 23:35:00 +0000".to_datetime == departure_date
    self.departure_date = "2018-10-20 20:00:00".to_datetime if "2018-05-12 22:00:00 +0000".to_datetime == departure_date
    self.departure_date = "2018-10-21 07:00:00".to_datetime if "2018-05-12 09:00:00 +0000".to_datetime == departure_date

    self.arrival_date = "2018-10-02 10:35:00".to_datetime if "2018-04-23 12:35:00 +0000".to_datetime == arrival_date
    self.arrival_date = "2018-10-21 05:30:00".to_datetime if "2018-05-13 07:30:00 +0000".to_datetime == arrival_date
    self.arrival_date = "2018-10-21 09:20:00".to_datetime if "2018-05-12 11:20:00 +0000".to_datetime == arrival_date
  end

end
