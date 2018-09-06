class AirbnbScrapper
  def initialize(email)
    @email = email
  end

  def scrap
    html_doc = Nokogiri::HTML(@email.raw_html)
    name = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[3]/table[2]/tbody/tr/th[1]/a/p[1]').text.strip
    reservation_number = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[13]/table/tbody/tr/th[1]/p[2]').text.strip
    owner = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[16]/table/tbody/tr/th[1]/p[1]').text.strip
    address = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[7]/table/tbody/tr/th[1]/p[2]').text.strip
    guests = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[9]/table/tbody/tr/th[1]/p[2]').text.strip
    phone_number = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[16]/table/tbody/tr/th[2]/a[2]/p').text.strip
    price = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[11]/table/tbody/tr/th[1]/p[2]').text.gsub(/\P{ASCII}/,'').strip
    arrival_date = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[5]/table/tbody/tr/th[1]').text.gsub(/\P{ASCII}/,'').strip
    departure_date = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[5]/table/tbody/tr/th[2]').text.gsub(/\P{ASCII}/,'').strip
    journey_email = @email.to
    journey_match = journey_email.first[:email].match(/^(.*?)\@/)
    journey_name = journey_match[1]
    journey = Journey.where("name ILIKE ?", "#{journey_name}").first

    if journey.nil?
      puts "error..."
      return nil
    end


    journey.accommodations.create!(name: "#{name}", owner: "#{owner}", reservation_number: "#{reservation_number}", address: "#{address}", guests: "#{guests}", telephone: "#{phone_number}", price: "#{price}", arrival_date: "#{arrival_date}", departure_date: "#{departure_date}")


    Notification.create(user: journey.user, journey: journey, message: "Your accommodation #{name} has been created")
     # need to figure out how to look for :name case insensitive
      # send accommodation to the journey
  end
end
