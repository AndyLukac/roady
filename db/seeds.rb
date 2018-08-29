puts "Je détruis tout"

Car.destroy_all
Train.destroy_all
Accommodation.destroy_all
Flight.destroy_all
Journey.destroy_all
User.destroy_all

puts "Je crée Matho"
matho = User.create!(
  email: "matho@lewagon.com",
  user_name: "Matho",
  password: "roady2018"
  )

puts "Je crée Argentina"
argentina = Journey.create!(
  name: "Argentina",
  date: "from 31/08/18 to 13/09/18",
  user: matho,
  )
argentina.remote_photo_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgCa1ae0KP-YCUlguGbhb-_i-r961zHujitcs3zQ0crp9UzsNK"
argentina.save

Train.create!(
  reservation_number: "H1N1",
  departure_place: "Lyon Part-Dieu",
  arrival_place: "Paris Charles de Gaulle",
  departure_date: "31/08/18 - 12.30pm",
  arrival_date: "31/08/18 - 14pm",
  price: 45,
  journey: argentina
  )

Flight.create!(
  reservation_number: "R2D2",
  flight_number: "AN 228",
  departure_place: "Paris Charles de Gaulle",
  arrival_place: "Buenos Aires Ezeiza",
  departure_date: "31/08/18 - 18.30pm",
  arrival_date: "01/09/18 - 8.15am",
  price: 816,
  journey_id: 8
  )

Car.create!(
  reservation_number: "H1N1",
  departure_place: "Buenos Aires Ezeiza",
  arrival_place: "Buenos Aires Ezeiza",
  brand: "Toyota",
  departure_date: "01/09/18 - 9am",
  arrival_date: "12/09/18 - 14pm",
  hiring_days: 12,
  price: 485,
  journey: argentina
  )


Accommodation.create!(
  reservation_number: "RESA1",
  arrival_date: "01/09/18 - 10am",
  departure_date: "5/09/18 - 10am",
  name: "Beautiful 2 bedroom appartment in Palermo district",
  owner: "Juan Andreas",
  address: "4517 Juan Francisco Seguí, Buenos Aires",
  guests: 1,
  price: 318,
  telephone: 5000,
  journey: argentina
  )

Accommodation.create!(
  reservation_number: "RESA2",
  arrival_date: "05/09/18 - 18pm",
  departure_date: "12/09/18 - 6am",
  name: "Casa Linda",
  owner: "Sofia Martinez",
  address: "314 Rincon, Cordoba",
  guests: 1,
  price: 290,
  telephone: 5000,
  journey: argentina
  )

Flight.create!(
  reservation_number: "4242",
  flight_number: "AN 42",
  departure_place: "Buenos Aires Ezeiza",
  arrival_place: "Paris Charles de Gaulle",
  departure_date: "12/09/18 - 19.30pm",
  arrival_date: "13/09/18 - 8.35am",
  price: 712,
  journey: argentina
  )

Train.create!(
  reservation_number: "G42D",
  departure_place: "Paris Charles de Gaulle",
  arrival_place: "Lyon Part-Dieu",
  departure_date: "13/09/18 - 11.30am",
  arrival_date: "13/09/18 - 13.45pm",
  price: 45,
  journey: argentina
  )

p JourneyItem.all

