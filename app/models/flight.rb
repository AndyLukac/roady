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
    case departure_date
    when "2018-04-22 21:35:00 +0000".to_time then self.departure_date = "2018-10-01 21:35:00".to_time
    when "2018-05-12 20:00:00 +0000".to_time then self.departure_date = "2018-10-20 20:00:00".to_time
    when "2018-05-12 07:00:00 +0000".to_time then self.departure_date = "2018-10-21 07:00:00".to_time
    end

    case arrival_date
    when "2018-04-23 10:35:00 +0000".to_time then self.arrival_date = "2018-10-02 10:35:00".to_time
    when "2018-05-13 05:30:00 +0000".to_time then self.arrival_date = "2018-10-21 05:30:00".to_time
    when "2018-05-12 09:20:00 +0000".to_time then self.arrival_date = "2018-10-21 09:20:00".to_time
    end
  end

end
