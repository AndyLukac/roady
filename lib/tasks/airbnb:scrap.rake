namespace :airbnb do
  task scrap: :environment do
    html = File.open("#{Rails.root}/db/emails/airbnb.html").read

    email = FalseEmail.new('nayeli@gmail.com', 'argentina@roady.club', html)
    EmailProcessor.new(email).process
  end
end

class FalseEmail
  attr_reader :from, :to, :raw_html

  def initialize(from, to, raw_html)
    @from = from
    @to = [to]
    @raw_html = raw_html
  end
end
