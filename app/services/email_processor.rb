class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    if airbnb?
      AirbnbScrapper.new(@email).scrap
    elsif booking?
    end
  end

  private

  def airbnb?
    html_doc = Nokogiri::HTML(@email.raw_html)
    airbnb = html_doc.search('/html/body/div/div/div[1]/strong').text.strip
    airbnb == "Airbnb"
  end

  def booking?
    puts "je usi sla"
    puts File.write('db/emails/expedia.html', @email.raw_html)
  end
end

