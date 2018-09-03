class AirbnbScrapper
  def initialize(raw_html)
    @raw_html = raw_html
  end

  def scrap
    html_doc = Nokogiri::HTML(@raw_html)
    puts reservation_number = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[3]/table[2]/tbody/tr/th[1]/a/p[1]').text.strip
    puts reservation_number = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[13]/table/tbody/tr/th[1]/p[2]').text.strip
    puts owner = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[16]/table/tbody/tr/th[1]/p[1]').text.strip
    puts address = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[7]/table/tbody/tr/th[1]/p[2]').text.strip
    puts guests = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[9]/table/tbody/tr/th[1]/p[2]').text.strip
    puts phone_number = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[16]/table/tbody/tr/th[2]/a[2]/p').text.strip
    puts price = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[11]/table/tbody/tr/th[1]/p[2]').text.gsub(/\P{ASCII}/,'').strip
    puts arrival_date = html_doc.search('/html/body/div/div/div[2]/table/tbody/tr/td/center/table/tbody/tr/td/div[5]/table/tbody/tr/th[1]').text.gsub(/\P{ASCII}/,'').strip
  end
end
