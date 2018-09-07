class EmailProcessor
  after_create :create_notification

  def initialize(email)
    @email = email
  end

  def process
    if airbnb?
      AirbnbScrapper.new(@email).scrap
    elsif expedia?
      ExpediaScrapper.new(@email).scrap
    end
  end

  private

  def airbnb?
    html_doc = Nokogiri::HTML(@email.raw_html)
    airbnb = html_doc.search('/html/body/div/div/div[1]/strong').text.strip
    airbnb == "Airbnb"
  end

  def expedia?
    ap "je suis la"
    html_doc = Nokogiri::HTML(@email.raw_html)
    expedia = html_doc.search('/html/body/div/div/div[1]/strong').text.strip
    ap expedia
    expedia == "Expedia.fr"
    @email.raw_html =~ /Expedia\.fr/
    # puts "je usi sla"
    # puts File.write('db/emails/expedia.html', @email.raw_html)
  end
end
