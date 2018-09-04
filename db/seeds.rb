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
  start_date: Date.parse("09/09/2018"),
  end_date: Date.parse("18/09/2018"),
  photo: "https://images.unsplash.com/photo-1535515505335-9319ebc5c0f9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=4ec0036447bd2866efc7125ecfa3494c&auto=format&fit=crop&w=2100&q=80",
  user: matho,
)

argentina.remote_photo_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgCa1ae0KP-YCUlguGbhb-_i-r961zHujitcs3zQ0crp9UzsNK"
argentina.save

puts "Je crée Portugal"
portugal = Journey.create!(
  name: "Portugal",
  start_date: Date.parse("19/10/2018"),
  end_date: Date.parse("30/10/2018"),
  photo: "https://images.unsplash.com/photo-1533421821268-87e42c1d70b0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0e842b07a75c9d65821adb8702eb36ea&auto=format&fit=crop&w=2156&q=80",
  user: matho,
)

portugal.remote_photo_url = "https://images.unsplash.com/photo-1533421821268-87e42c1d70b0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0e842b07a75c9d65821adb8702eb36ea&auto=format&fit=crop&w=2156&q=80"
portugal.save

puts "Je crée Australia"
australia = Journey.create!(
  name: "Australia",
  start_date: Date.parse("14/02/2019"),
  end_date: Date.parse("02/03/2019"),
  photo: "https://images.unsplash.com/photo-1526515579900-98518e7862cc?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=42b611886fc412d079ccf510efc5303e&auto=format&fit=crop&w=2082&q=80",
  user: matho,
)

australia.remote_photo_url = "https://images.unsplash.com/photo-1526515579900-98518e7862cc?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=42b611886fc412d079ccf510efc5303e&auto=format&fit=crop&w=2082&q=80"
australia.save

puts "Je crée Philippines"
philippines = Journey.create!(
  name: "Philippines",
  start_date: Date.parse("16/04/2019"),
  end_date: Date.parse("30/04/2019"),
  photo: "https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86?ixlib=rb-0.3.5&s=4425c21b1d334e81426014de8df3035e&auto=format&fit=crop&w=1867&q=80",
  user: matho,
)

philippines.remote_photo_url = "https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86?ixlib=rb-0.3.5&s=4425c21b1d334e81426014de8df3035e&auto=format&fit=crop&w=1867&q=80"
philippines.save

Train.create!(
  reservation_number: "H1N1",
  departure_place: "Lyon Part-Dieu",
  arrival_place: "Paris Charles de Gaulle",
  departure_date: DateTime.parse("09/09/2018 06:00pm"),
  arrival_date: DateTime.parse("09/09/2018 08:00pm"),
  price: 45,
  journey: argentina
  )

Flight.create!(
  reservation_number: "R2D2",
  flight_number: "AN 228",
  departure_place: "Paris Charles de Gaulle",
  arrival_place: "Buenos Aires Ezeiza",
  departure_date: DateTime.parse("09/09/2018 10:00pm"),
  arrival_date: DateTime.parse("10/09/2018 12:00pm"),
  price: 816,
  journey: argentina
  )

Car.create!(
  reservation_number: "H1N1",
  departure_place: "Buenos Aires Ezeiza",
  arrival_place: "Buenos Aires Ezeiza",
  brand: "Toyota",
  departure_date: DateTime.parse("10/09/2018 02:00pm"),
  arrival_date: DateTime.parse("17/09/2018 09:00pm"),
  hiring_days: 12,
  price: 485,
  journey: argentina
  )


Accommodation.create!(
  reservation_number: "RESA1",
  arrival_date: DateTime.parse("10/09/2018 05:00pm"),
  departure_date: DateTime.parse("14/09/2018 10:00am"),
  name: "Palermo district",
  owner: "Juan Andreas",
  address: "4517 Juan Francisco Seguí, Buenos Aires",
  guests: 1,
  price: 318,
  telephone: 5000,
  journey: argentina
  )

Accommodation.create!(
  reservation_number: "RESA2",
  arrival_date: DateTime.parse("14/09/2018 05:00pm"),
  departure_date: DateTime.parse("17/09/2018 02:00pm"),
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
  departure_date: DateTime.parse("17/09/2018 11:00pm"),
  arrival_date: DateTime.parse("18/09/2018 11:30am"),
  price: 712,
  journey: argentina
  )

Train.create!(
  reservation_number: "G42D",
  departure_place: "Paris Charles de Gaulle",
  arrival_place: "Lyon Part-Dieu",
  departure_date: DateTime.parse("18/09/2018 02:30pm"),
  arrival_date: DateTime.parse("18/09/2018 04:30pm"),
  price: 45,
  journey: argentina
  )

p JourneyItem.all

