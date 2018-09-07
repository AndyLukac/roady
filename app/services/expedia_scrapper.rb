class ExpediaScrapper

  MONTHS= %w(jan. fev. mar. avr. mai juin jui. aout sep. oct. nov. dec.)

  def initialize(email)
    @email = email
  end

  def scrap
    Flight
    html_doc = Nokogiri::HTML(@email.raw_html)

    id = html_doc.xpath('.//*[@alt="flight to"]').first.parent['class'].match(/m_(-?\d+)split/)[1]

    reservation_number = html_doc.search('//*[@id="m_' + id + 'email-module-container"]/tbody/tr[8]/td/table[1]/tbody/tr[5]/td/table/tbody/tr/td/div[2]').text.strip
    go_flight_number = #html_doc.search('//*[@id="m_' + id + 'email-module-container"]/tbody/tr[8]/td/table[2]/tbody/tr[3]/td/span').text.strip
    go_departure_date = #html_doc.search('//*[@id="m_' + id + 'email-module-container"]/tbody/tr[8]/td/table[2]/tbody/tr[2]/td/span[3]').text.strip
    price = #html_doc.search('//*[@id="m_' + id + 'flight-total-amount"]/strong').text.gsub(/\P{ASCII}/,'').strip
    go_arrival_date = html_doc.search('//*[@id="m_' + id + 'check-in-out-time-section"]/tbody/tr/td[3]/table/tbody/tr[3]/td/span').text.gsub(/\P{ASCII}/,'').strip
    return_flight_number = html_doc.search('//*[@id="m_' + id + 'email-module-container"]/tbody/tr[8]/td/table[4]/tbody/tr[3]/td/span').text.strip
    return_departure_date = html_doc.search('//*[@id="m_' + id + 'email-module-container"]/tbody/tr[8]/td/table[4]/tbody/tr[2]/td/span[3]').text.strip
    return_arrival_date = html_doc.search('//*[@id="m_' + id + 'check-in-out-time-section"]/tbody/tr/td[3]/table/tbody/tr[4]/td/span').text.strip
    journey_email = Array(@email.to).first[:email]

    journey_match = journey_email.match(/^(.*?)\@/)
    journey_name = journey_match[1]
    journey = Journey.where("name ILIKE ?", "#{journey_name}" ).first

    if journey.nil?
      puts "error..."
      return nil
    end

    ap "id"
    ap id

    section_ids = "m_#{id}check-in-out-time-section"

    ap @email.raw_html.match(/#{section_ids}/)

    sections = html_doc.xpath("//*[@id=\"#{section_ids}\"]")


    sections.each do |section|


      departure_date_array = section.parent.parent.parent.parent.search('./tbody/tr[2]/td/span[3]').text.strip.split(' ')[1..-1]
      departure_date_array[1] = (MONTHS.index(departure_date_array[1]) + 1).to_s
      departure_date = "2018-#{departure_date_array[1]}-#{departure_date_array[0]}"

      city_departure    = section.search('table/tbody/tr[1]/td/div').first.text.strip
      city_arrival      = section.search('table/tbody/tr[1]/td/div').last.text.strip
      time_departure    = section.search('./tbody/tr/td[1]/table/tbody/tr[2]/td/span[1]').text.strip.gsub(' h ', ':')
      time_arrival      = section.search('./tbody/tr/td[3]/table/tbody/tr[2]/td/span[1]').text.strip.gsub(' h ', ':')


      # p flight = {
      #   city_departure: city_departure,
      #   time_departure: time_departure,
      #   time_arrival: time_arrival
      # }
      # flights << flight

      datetime_departure = "#{departure_date} #{time_departure}:00".to_time

      last_flight = Flight.last

      if last_flight && last_flight.arrival_place == city_departure && last_flight.departure_date.to_date == departure_date.to_date
        datetime_departure += 1.day
      end

      datetime_arrival   = "#{departure_date} #{time_arrival}:00".to_time


      datetime_arrival += 1.day if datetime_arrival < datetime_departure

      journey.flights.create!(
        reservation_number: "#{reservation_number}",
        go_flight_number: "#{go_flight_number}",
        go_arrival_date: "#{go_arrival_date}",
        return_flight_number: "#{return_flight_number}",
        return_departure_date:"#{return_departure_date}",
        return_arrival_date: "#{return_arrival_date}",
        price: "#{price}",
        flights: [],
        departure_date: datetime_departure,
        arrival_date: datetime_arrival,
        departure_place: city_departure,
        arrival_place: city_arrival,
        )
    end

    Notification.create!(user: journey.user, journey: journey, message: "Your flight #{reservation_number} has been created for #{journey.name}")
  end
end
