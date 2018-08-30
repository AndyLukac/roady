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
  start_date: Date.parse("31/08/2018"),
  end_date: Date.parse("13/09/2018"),
  photo: "https://images.unsplash.com/photo-1535515505335-9319ebc5c0f9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=4ec0036447bd2866efc7125ecfa3494c&auto=format&fit=crop&w=2100&q=80",
  user: matho,
)

argentina.remote_photo_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgCa1ae0KP-YCUlguGbhb-_i-r961zHujitcs3zQ0crp9UzsNK"
argentina.save

Train.create!(
  reservation_number: "H1N1",
  departure_place: "Lyon Part-Dieu",
  arrival_place: "Paris Charles de Gaulle",
  departure_date: DateTime.parse("31/08/2018 6:00pm"),
  arrival_date: DateTime.parse("31/08/2018 8:00pm"),
  price: 45,
  journey: argentina
  )

Flight.create!(
  reservation_number: "R2D2",
  flight_number: "AN 228",
  departure_place: "Paris Charles de Gaulle",
  arrival_place: "Buenos Aires Ezeiza",
  departure_date: DateTime.parse("01/09/2018 2:00pm"),
  arrival_date: DateTime.parse("01/09/2018 8:00pm"),
  price: 816,
  journey: argentina
  )

Car.create!(
  reservation_number: "H1N1",
  departure_place: "Buenos Aires Ezeiza",
  arrival_place: "Buenos Aires Ezeiza",
  brand: "Toyota",
  departure_date: DateTime.parse("02/09/2018 10:00am"),
  arrival_date: DateTime.parse("04/09/2018 2:00pm"),
  hiring_days: 12,
  price: 485,
  journey: argentina
  )


Accommodation.create!(
  reservation_number: "RESA1",
  arrival_date: DateTime.parse("02/09/2018 10:00am"),
  departure_date: DateTime.parse("04/09/2018 10:00am"),
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
  arrival_date: DateTime.parse("05/09/2018 11:00am"),
  departure_date: DateTime.parse("06/09/2018 2:00pm"),
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
  departure_date: DateTime.parse("07/09/2018 07:30pm"),
  arrival_date: DateTime.parse("07/09/2018 10:30pm"),
  price: 712,
  journey: argentina
  )

Train.create!(
  reservation_number: "G42D",
  departure_place: "Paris Charles de Gaulle",
  arrival_place: "Lyon Part-Dieu",
  departure_date: DateTime.parse("08/09/2018 12:30pm"),
  arrival_date: DateTime.parse("08/09/2018 5:30pm"),
  price: 45,
  journey: argentina
  )

p JourneyItem.all

