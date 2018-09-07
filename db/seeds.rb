puts "Je détruis tout"

Car.destroy_all
Train.destroy_all
Accommodation.destroy_all
Flight.destroy_all
Notification.destroy_all
Journey.destroy_all
User.destroy_all

puts "Je crée Nayeli"
nayeli = User.create!(
  email: "nayeli@gmail.com",
  user_name: "Nayeli",
  password: "roady2018"
)

puts "Je crée Au pays des merveilles"
merveilles = Journey.create!(
  name: "Au pays des merveilles",
  start_date: Date.parse("20/12/2018"),
  end_date: Date.parse("26/12/2018"),
  photo: "https://booknode.com/actus-litteraires/wp-content/uploads/2016/07/alice-au-pays-des-merveilles-fleurs.jpg",
  user: nayeli,
)

merveilles.remote_photo_url = "https://booknode.com/actus-litteraires/wp-content/uploads/2016/07/alice-au-pays-des-merveilles-fleurs.jpg"
merveilles.save



puts "Je crée Vietnam"
vietnam = Journey.create!(
  name: "Vietnam",
  start_date: Date.parse("11/03/2019"),
  end_date: Date.parse("24/03/2019"),
  photo: "http://sumabeachlifestyle.com/wp-content/uploads/2016/05/Rice-Fields-in-Sapa-Vietnam.jpg",
  user: nayeli,
)

vietnam.remote_photo_url = "http://sumabeachlifestyle.com/wp-content/uploads/2016/05/Rice-Fields-in-Sapa-Vietnam.jpg"
vietnam.save

puts "Je crée New Zealand"
newzealand = Journey.create!(
  name: "New Zealand",
  start_date: Date.parse("29/06/2019"),
  end_date: Date.parse("15/07/2019"),
  photo: "http://www.woolsnz.com/images/Lake%20Hawea.jpg",
  user: nayeli,
)

newzealand.remote_photo_url = "http://www.woolsnz.com/images/Lake%20Hawea.jpg"
newzealand.save

puts "Je crée Ireland"
ireland = Journey.create!(
  name: "Ireland",
  start_date: Date.parse("12/10/2019"),
  end_date: Date.parse("22/10/2019"),
  photo: "https://www.worldtravelguide.net/wp-content/uploads/2017/04/shu-Ireland-Clare-DoonagoreCastle-244049320-Patryk-Kosmider-copy.jpg",
  user: nayeli,
)

ireland.remote_photo_url = "https://www.worldtravelguide.net/wp-content/uploads/2017/04/shu-Ireland-Clare-DoonagoreCastle-244049320-Patryk-Kosmider-copy.jpg"
ireland.save

Flight.create!(
  reservation_number: "G16THY",
  departure_place: "Lyon-Saint Exupéry Airport, France",
  arrival_place: "Dublin, Ireland",
  departure_date: DateTime.parse("11/10/2018 02:00pm"),
  arrival_date: DateTime.parse("11/11/2018 04:00pm"),
  price: 225,
  journey: ireland
)

Accommodation.create!(
  reservation_number: "RESA1",
  arrival_date: DateTime.parse("11/11/2018"),
  departure_date: DateTime.parse("17/11/2018"),
  check_in: "06:00pm",
  check_out: "10:00am",
  name: "Luxury and cosy room in city centre!",
  owner: "John Bing",
  address: "Cumberland St N, Rotunda, Dublin",
  guests: 2,
  image: "https://www.bing.com/th?id=OIP.ykcSJ4Tg_qhKXXefJH4s_QHaFj&pid=Api",
  price: 50,
  telephone: 347383683,
  journey: ireland
  )

Train.create!(
  reservation_number: "T16THY",
  departure_place: "Heuston Station, St. Johns Road West, Dublin 8, Ireland",
  arrival_place: "Terminus St, Co. Waterford, Ireland",
  departure_date: DateTime.parse("17/11/2018 12:00pm"),
  arrival_date: DateTime.parse("17/11/2018 02:00pm"),
  price: 45,
  journey: ireland
)

Accommodation.create!(
  reservation_number: "HGTYF21",
  arrival_date: DateTime.parse("17/11/2018"),
  departure_date: DateTime.parse("22/11/2018"),
  check_in: "04:00pm",
  check_out: "02:00pm",
  name: "Double Bed-Room with Private Bathroom",
  owner: "Harry Jones",
  address: "25-3 Parnell St, Waterford, Ireland",
  guests: 2,
  image: "https://a0.muscache.com/im/pictures/8d4b2814-642e-40c0-9eaa-33a0901c965d.jpg?aki_policy=xx_large",
  price: 275,
  telephone: 347383683,
  journey: ireland
  )

Flight.create!(
  reservation_number: "HN568459",
  departure_place: "Killowen, Co. Waterford, X91 E2WP, Ireland",
  arrival_place: "Lyon-Saint Exupéry Airport, France",
  departure_date: DateTime.parse("22/11/2018 05:00pm"),
  arrival_date: DateTime.parse("22/11/2018 07:00pm"),
  price: 712,
  journey: ireland
  )


p JourneyItem.all

