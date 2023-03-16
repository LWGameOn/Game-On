require 'faker'
require 'open-uri'
Chatroom.destroy_all
Event.destroy_all
User.destroy_all

url = [
        "https://i.pinimg.com/236x/53/6a/52/536a52c154460fd9fbec2e20f9f699ba.jpg",
        "https://i.pinimg.com/originals/4b/a2/12/4ba2123312cb69d61f99fad616c57526.jpg",
        "https://i.pinimg.com/originals/2a/9d/40/2a9d4006c35a8ead0c37c3117cb37d4f.jpg",
        "https://i.pinimg.com/236x/0b/b9/78/0bb978143eb14edf0832990ae34fdb58.jpg",
        "https://i.pinimg.com/236x/40/cc/bf/40ccbfeecd39be3cb3d5c7231a5cbee8.jpg",
        "https://i.pinimg.com/736x/5c/c7/ed/5cc7edbcd2a50dd527682817b92c92f6.jpg",
        "https://i.imgur.com/KeseXNR.jpg",
        "https://i.pinimg.com/474x/0d/42/18/0d4218246aebac5ad2ea345775889176.jpg",
        "https://i.pinimg.com/236x/df/6c/68/df6c6872cf18635982392c324d3f9264.jpg",
        "https://i.kym-cdn.com/photos/images/newsfeed/001/688/993/53d",
        "https://i.pinimg.com/736x/f3/2a/6f/f32a6f905e173ffebc2d70505210d3d2.jpg",
        "https://i.pinimg.com/236x/4c/8d/4f/4c8d4fcf08859152450ab99c15266159.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBA55eiGGK4w0ezZnoo7T9pyjijRN6LDq0Y5qSMJ0taiQ-a8dpBwK3z2FGx9KP-R-T6xo&usqp=CAU",
        "https://i.pinimg.com/736x/88/d0/73/88d073863ff356e5a6d7e00b75140b85.jpg",
        "https://i.pinimg.com/236x/27/c7/af/27c7af04f7bee2f01c7411056052d053.jpg",
        "https://i.pinimg.com/236x/61/ab/b0/61abb030f3a922a7ecb31af0e79ff270.jpg",
        "https://i.pinimg.com/236x/2f/64/c4/2f64c48944573c92558bec01c7d6c502.jpg",
        "https://www.gamespot.com/a/uploads/scale_landscape/1597/15971423/3883502-2014028350-EgWZL.jpg",
        "https://i.pinimg.com/236x/ec/03/e8/ec03e82b59f6cf90fd19f881fc57e2c9.jpg",
        "https://i.pinimg.com/originals/c2/36/07/c236076f09489ebac20da92c22a024aa.jpg"
      ]

locations = [
  "Treptower Park, Berlin",
  "Tempelhofer Feld, Berlin",
  "Görlitzer Park, Görlitzer Straße, Berlin",
  "Volkspark Friedrichshain, Berlin",
  "Tiergarten, Berlin",
  "Volkspark Hasenheide, Berlin",
  "Viktoriapark, Katzbachstraße, Berlin",
  "Rudi-Dutschke-Straße 26, 10969 Berlin",
  "Mauerpark, Gleimstraße, Berlin",
  "Volkspark Humboldthain, Berlin",
  "Eiffel Tower, 5 avenue Anatole France, Paris, 75007, France",
  "Victoria Park, Victoria St, Auckland, Auckland 1010, New Zealand",
  "Albert Park, Princes St., Auckland, Auckland 1010, New Zealand",
  "Rua Jaime Lerner Qd 9 Paraíso do Tocantins - Tocantins, Brazil",
  "Tokyo Tower, Tokyo, Japan",
  "Pyongyang, North Korea",
  "Antarctica",
  "Central Park, New York City, New York 10128, United States",
  "Kalgoorlie Super Pit, Western Australia 6432, Australia"
]

event_url = [
  "https://images.pexels.com/photos/163444/sport-treadmill-tor-route-163444.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80",
  "https://s1.1zoom.me/big0/855/349302-admin.jpg",
  "https://img.freepik.com/fotos-kostenlos/sportgeraete_53876-138077.jpg?w=1800&t=st=1678878545~exp=1678879145~hmac=e4e5b11b97df4b60dcce7ff7232d458c86f7e32588e4fec42e2f58bbcaeae8d9",
  "https://c4.wallpaperflare.com/wallpaper/515/677/288/nike-running-and-sunrise-wallpaper-preview.jpg",
  "https://images.pexels.com/photos/209981/pexels-photo-209981.jpeg?auto=compress&cs=tinysrgb&w=1600",
  "https://images.pexels.com/photos/5967947/pexels-photo-5967947.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
]

i = 0

20.times do
  image = URI.open(url[i])
  user = User.new(
    email: Faker::Internet.email,
    password: "gameon1312",
    username: Faker::Internet.username,
    bio: Faker::TvShows::Simpsons.quote
    )
  user.avatar.attach(io: image, filename: "profpic.jpg", content_type: "image/jpg")
  user.save
  i += 1
end

i = 0

  50.times do
    puts i
    user = User.all.sample
    sport = ["football", "basketball", "volleyball", "tennis", "baseball", "badminton", "cricket", "rugby"]
    sport_type = sport.sample
    level = ["expert", "beginner", "intermediate"].sample
    event_image = URI.open(event_url[i % 7])

  event = Event.new(
      name: "#{sport_type.capitalize} Time",
      description: "I'm looking for #{sport_type} enthusiasts. If you are one of them. Please feel free to join our team. It will be #{level} friendly.",
      location: locations.sample,
      date: Faker::Time.forward(days: 60, period: :all),
      capacity: rand(2..20),
      sport: sport_type,
      user_id: user.id
  )
  event.photo.attach(io: event_image, filename: "event.jpg", content_type: "image/jpg")
  i += 1

  Chatroom.create(
    event: event
  )
  event.save
  Play.create(
    user: user,
    event: event
  )
  end
  puts "Finished"
