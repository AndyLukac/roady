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


puts "Je crée Ireland"
ireland = Journey.create!(
  name: "Ireland",
  start_date: Date.parse("12/03/2019"),
  end_date: Date.parse("20/03/2019"),
  photo: "https://www.worldtravelguide.net/wp-content/uploads/2017/04/shu-Ireland-Clare-DoonagoreCastle-244049320-Patryk-Kosmider-copy.jpg",
  user: nayeli,
)

ireland.remote_photo_url = "https://www.worldtravelguide.net/wp-content/uploads/2017/04/shu-Ireland-Clare-DoonagoreCastle-244049320-Patryk-Kosmider-copy.jpg"
ireland.save

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

puts "Je crée Vietnam"
vietnam = Journey.create!(
  name: "Vietnam",
  start_date: Date.parse("11/11/2019"),
  end_date: Date.parse("24/11/2019"),
  photo: "http://sumabeachlifestyle.com/wp-content/uploads/2016/05/Rice-Fields-in-Sapa-Vietnam.jpg",
  user: nayeli,
)

vietnam.remote_photo_url = "http://sumabeachlifestyle.com/wp-content/uploads/2016/05/Rice-Fields-in-Sapa-Vietnam.jpg"
vietnam.save

Flight.create!(
  reservation_number: "G16THY",
  flight_number: "H1 YT56",
  departure_place: "Lyon, France",
  arrival_place: "Phú Minh, Sóc Sơn, Hà Nội, Vietnam",
  departure_date: DateTime.parse("11/11/2018 06:00pm"),
  arrival_date: DateTime.parse("12/11/2018 03:00am"),
  price: 2005,
  journey: vietnam
)

Accommodation.create!(
  reservation_number: "RESA1",
  arrival_date: DateTime.parse("12/11/2018 07:00am"),
  departure_date: DateTime.parse("17/11/2018 10:00am"),
  name: "Comfy Studio Apt near Thien Quang Lake",
  owner: "JHai Bà Trưng",
  address: "27 Đồng Nhân, Hai Bà Trưng, Hà Nội, Vietnam",
  guests: 2,
  image: "https://a0.muscache.com/im/pictures/e8425ed4-612a-4abf-815f-ea88464ef0ad.jpg?aki_policy=xx_large",
  price: 318,
  telephone: 347383683,
  journey: vietnam
  )

Train.create!(
  reservation_number: "T16THY",
  departure_place: "120 Lê Duẩn, Văn Miếu, Hoàn Kiếm, Hà Nội, Vietnam",
  arrival_place: "75 Lương Khánh Thiện, Lương Khá Thien, Ngô Quyền, Hải Phòng, Vietnam",
  departure_date: DateTime.parse("17/11/2018 12:00pm"),
  arrival_date: DateTime.parse("17/11/2018 03:00pm"),
  price: 45,
  journey: vietnam
)

Accommodation.create!(
  reservation_number: "HGTYF21",
  arrival_date: DateTime.parse("17/11/2018 10:00am"),
  departure_date: DateTime.parse("23/11/2018 02:00pm"),
  name: "KIARA’S HOME - UNIQUE VILLA. Room 1",
  owner: "Đằng Hải",
  address: "89 Đằng Hải, Hải An, Hải Phòng, Vietnam",
  guests: 2,
  image: "https://a0.muscache.com/im/pictures/6d741345-a4a5-4976-a8aa-6c67d0877759.jpg?aki_policy=xx_large",
  price: 318,
  telephone: 347383683,
  journey: vietnam
  )

Flight.create!(
  reservation_number: "HN568459",
  flight_number: "AN 42",
  departure_place: "Lê Hồng Phong, Hải An, Đằng Lâm Hải An Hải Phòng, Vietnam",
  arrival_place: "Lyon, France",
  departure_date: DateTime.parse("23/11/2018 05:00pm"),
  arrival_date: DateTime.parse("24/11/2018 04:30am"),
  price: 712,
  journey: vietnam
  )


p JourneyItem.all

