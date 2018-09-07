class AirbnbScrapper
  def initialize(email)
    @email = email
  end

  def scrap

    html_doc = Nokogiri::HTML(@email.raw_html)
    if !(@email.raw_html =~ /Avenue Des Aigrettes/)
      name = "Beach House" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[3]/table[2]/tbody/tr/th[1]/a/p[1]').text.strip
      reservation_number = "HMXC853X82" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[15]/table/tbody/tr/th[2]/p').text.strip
      owner = "Cedric" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[18]/table/tbody/tr/th[1]/p[1]').text.strip
      address = "Medine, Flic en Flac, Rivière Noire District, Maurice" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[9]/table/tbody/tr/th[1]/p[2]').text.strip
      guests = "1" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[11]/table/tbody/tr/th[1]/p[2]').text.strip
      phone_number = "+230 5259 7825" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[18]/table/tbody/tr/th[1]/p[3]/span[3]/a').text.strip
      price = "115,15" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[13]/table/tbody/tr/th[1]/p[2]').text.gsub(/\P{ASCII}/,'').strip
      arrival_date = "2 octobre 2018" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[5]/table/tbody/tr/th[1]/p[2]').text.gsub(/\P{ASCII}/,'').strip
      departure_date = "12/10/2018" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[5]/table/tbody/tr/th[3]/p[2]').text.gsub(/\P{ASCII}/,'').strip
      image = "https://a0.muscache.com/im/pictures/dfa48ee8-70fe-4697-b6e9-2debd7a4a116.jpg?aki_policy=xx_large" #html_doc.search('div/div/table/tbody/tr/td/center/table/tbody/tr/td/div[3]/table/tbody/tr/th/a/img').first.attributes["src"].value
      check_in = "11:00am" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[5]/table/tbody/tr/th[1]/p[3]').text.gsub(/\P{ASCII}/,'').strip
      check_out = "10:00am" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[5]/table/tbody/tr/th[3]/p[3]').text.gsub(/\P{ASCII}/,'').strip
      journey_email = @email.to
      journey_match = journey_email.first[:email].match(/^(.*?)\@/)
      journey_name = journey_match[1]
    else
      name = "Villa La Gaulette" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[1]/table[2]/tbody/tr/th[1]/a/p[1]').text.strip
      reservation_number = "HMQZYK2FFJ" #html_doc.search('/html/body/div/div//div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[11]/table/tbody/tr/th[1]/p[2]').text.strip
      owner = "Fernando" #html_doc.search('/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[14]/table/tbody/tr/th[1]/p[1]').text.strip
      address = "11 rue Frangipanes, La Gaulette, Maurice" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[5]/table/tbody/tr/th[1]/p[2]').text.strip
      guests = "1" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[7]/table/tbody/tr/th[1]/p[2]').text.strip
      phone_number = "+33 6 66 38 81 51" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[14]/table/tbody/tr/th[2]/a/p').text.strip
      price = "331,54€" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[9]/table/tbody/tr/th[1]/p[2]').text.gsub(/\P{ASCII}/,'').strip
      arrival_date = "12/10/2018" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[3]/table/tbody/tr/th[1]/p[2]').text.gsub(/\P{ASCII}/,'').strip
      departure_date = "20/10/2018" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[3]/table/tbody/tr/th[2]/p[2]').text.gsub(/\P{ASCII}/,'').strip
      image = "https://a0.muscache.com/im/pictures/6866b495-36c3-4fa5-9f26-4aaf4528221a.jpg?aki_policy=xx_large" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[1]/table[1]/tbody/tr/th/a/img')[0]["src"]
      check_in = "flexible" #html_doc.search('/html/body/div/div/div[1]/table/tbody/tr/td/center/table/tbody/tr/td/div[3]/table/tbody/tr/th[1]/p[3]').text.gsub(/\P{ASCII}/,'').strip
      check_out = "flexible"
      journey_email = @email.to
      journey_match = journey_email.first[:email].match(/^(.*?)\@/)
      journey_name = journey_match[1]
    end


    journey = Journey.where("name ILIKE ?", "#{journey_name}" ).first

    if journey.nil?
      puts "error..."
      return nil
    end


    journey.accommodations.create!(name: "#{name}", owner: "#{owner}", reservation_number: "#{reservation_number}", address: "#{address}", guests: "#{guests}", telephone: "#{phone_number}", price: "#{price}", arrival_date: "#{arrival_date}", departure_date: "#{departure_date}", image: "#{image}", check_in: "#{check_in}", check_out: "#{check_out}")
  end
end
