class ExpediaScrapper
  def initialize(email)
    @email = email
  end

  def scrap
    html_doc = Nokogiri::HTML(@email.raw_html)
    p reservation_number = html_doc.search('//*[@id="m_9096848708246845962email-module-container"]/tbody/tr[8]/td/table[1]/tbody/tr[5]/td/table/tbody/tr/td/div[2]').text.strip
    p flight_number = html_doc.search('//*[@id="m_9096848708246845962email-module-container"]/tbody/tr[8]/td/table[2]/tbody/tr[3]/td/span').text.strip
    p departure_date = html_doc.search('//*[@id="m_9096848708246845962email-module-container"]/tbody/tr[8]/td/table[2]/tbody/tr[2]/td/span[3]').text.strip
    p price = html_doc.search('//*[@id="m_9096848708246845962FlightFare_1_1_Adulte"]').text.gsub(/\P{ASCII}/,'').strip
    p arrival_date = html_doc.search('//*[@id="m_9096848708246845962check-in-out-time-section"]/tbody/tr/td[3]/table/tbody/tr[3]/td/span').text.gsub(/\P{ASCII}/,'').strip
    p journey_email = @email.to

    p journey_match = journey_email.match(/^(.*?)\@/)
    p journey_name = journey_match[1]
    journey = Journey.where("name ILIKE ?", "#{journey_name}" ).first

    if journey.nil?
      puts "error..."
      return nil
    end


    journey.flights.create!(reservation_number: "#{reservation_number}", flight_number: "#{flight_number}", departure_date: "#{departure_date}", arrival_date: "#{arrival_date}", price: "#{price}")
  end
end
