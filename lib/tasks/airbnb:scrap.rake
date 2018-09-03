namespace :airbnb do
  task scrap: :environment do
    html = File.open("#{Rails.root}/db/emails/airbnb.html")
    AirbnbScrapper.new(html).scrap
  end
end
