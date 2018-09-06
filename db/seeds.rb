puts "Je détruis tout"

Car.destroy_all
Train.destroy_all
Accommodation.destroy_all
Flight.destroy_all
Journey.destroy_all
User.destroy_all

puts "Je crée Nayeli"
nayeli = User.create!(
  email: "nayeli@gmail.com",
  user_name: "Nayeli",
  password: "roady2018"
)

puts "Je crée Maurice"
maurice = Journey.create!(
  name: "Maurice",
  start_date: Date.parse("09/09/2018"),
  end_date: Date.parse("18/09/2018"),
  photo: "https://images.unsplash.com/photo-1535515505335-9319ebc5c0f9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=4ec0036447bd2866efc7125ecfa3494c&auto=format&fit=crop&w=2100&q=80",
  user: nayeli,
)

maurice.remote_photo_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgCa1ae0KP-YCUlguGbhb-_i-r961zHujitcs3zQ0crp9UzsNK"
maurice.save


Train.create!(
  reservation_number: "H1N1",
  departure_place: "Lyon Part-Dieu",
  arrival_place: "Paris Charles de Gaulle",
  departure_date: DateTime.parse("09/09/2018 06:00pm"),
  arrival_date: DateTime.parse("09/09/2018 08:00pm"),
  price: 45,
  journey: maurice
  )

Flight.create!(
  reservation_number: "R2D2",
  flight_number: "AN 228",
  departure_place: "Paris Charles de Gaulle",
  arrival_place: "Mahébourg, île Maurice",
  departure_date: DateTime.parse("09/09/2018 10:00pm"),
  arrival_date: DateTime.parse("10/09/2018 12:00pm"),
  price: 816,
  journey: maurice
  )

Car.create!(
  reservation_number: "H1N1",
  departure_place: "Plaine Magnien-Mahebourg Road, Maurice",
  arrival_place: "Plaine Magnien-Mahebourg Road, Maurice",
  brand: "Toyota",
  departure_date: DateTime.parse("10/09/2018 02:00pm"),
  arrival_date: DateTime.parse("17/09/2018 09:00pm"),
  hiring_days: 12,
  price: 485,
  journey: maurice
  )


Accommodation.create!(
  reservation_number: "RESA1",
  arrival_date: DateTime.parse("10/09/2018 05:00pm"),
  departure_date: DateTime.parse("14/09/2018 10:00am"),
  name: "Stunning cabin on the sea",
  owner: "Juan Andreas",
  address: "Village Hall Street, Grande Rivière Sud Est, Maurice",
  guests: 1,
  image: "https://images.unsplash.com/photo-1524082983062-21c24967d6c9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0a1532b84f66efdf63f7af7b1f0493f5&auto=format&fit=crop&w=858&q=80",
  price: 318,
  telephone: 5000,
  journey: maurice
  )


Flight.create!(
  reservation_number: "4242",
  flight_number: "AN 42",
  departure_place: "Mahébourg, île Maurice",
  arrival_place: "Paris Charles de Gaulle",
  departure_date: DateTime.parse("17/09/2018 11:00pm"),
  arrival_date: DateTime.parse("18/09/2018 11:30am"),
  price: 712,
  journey: maurice
  )

Train.create!(
  reservation_number: "G42D",
  departure_place: "Paris Charles de Gaulle",
  arrival_place: "Lyon Part-Dieu",
  departure_date: DateTime.parse("18/09/2018 02:30pm"),
  arrival_date: DateTime.parse("18/09/2018 04:30pm"),
  price: 45,
  journey: maurice
  )

p JourneyItem.all

