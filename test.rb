p "coucou"

p Journey.last


email = open('db/emails/airbnb.html').read

p Journey.find_by(name: 'Argentina').accommodations.count
EmailProcessor.new(email).process
p Journey.find_by(name: 'Argentina').accommodations.count
