require 'faker'
require 'open-uri'
Chatroom.destroy_all
Event.destroy_all
User.destroy_all

url = ["https://i.pinimg.com/236x/53/6a/52/536a52c154460fd9fbec2e20f9f699ba.jpg",
        "https://images.unsplash.com/photo-1676439977212-dff72fea5a0b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDM3OQ&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1677103216895-59fb1b6a4fcd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDQxMQ&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1677991420292-b61eaabf0429?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDQ4Nw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1677169547901-19793d20c406?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDUwNA&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1677108581323-7050fbfd528f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDUxNw&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1677589205417-338f4d164cf6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDUxOQ&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1677856217095-65c6e0e4bd70?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDU1OA&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1678827502516-95bb7caedf66?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDU5Mg&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1676369134328-bdf38611bfca?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDY0NQ&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1678213740405-498f18aebf8c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDcwNg&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1676401428831-fcec7477db88?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDczNg&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1676466672775-dffec52d3f8c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDczOA&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1677512447102-237d00a3e902?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDc0Mg&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1678276747715-9d5b9d1c8ec3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDc4NQ&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1676737050518-d48d79cb9169?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDc5NA&ixlib=rb-4.0.3&q=80&w=1080",
        "https://images.unsplash.com/photo-1677005142678-d141a1eabbe9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY3ODg5MDgzMg&ixlib=rb-4.0.3&q=80&w=1080",
        "https://content.asos-media.com/-/media/images/articles/men/2014/07/14-mon/berlin-fashion-week-street-styles/streetstyles-bfw-3-asos-jessica-weber.jpg",
        "https://d21xzygesx9h0w.cloudfront.net/TUTOROO-French-Tutor-Berlin-Jean-baptiste-Dubruque-89523.jpg",
        "https://d21xzygesx9h0w.cloudfront.net/TUTOROO-French-Tutor-Wellington-Romain-Littardi-169891.jpg",
        "https://d21xzygesx9h0w.cloudfront.net/TUTOROO-French-Tutor-Berlin-Julien-Bocquet-164950.jpg",
        "https://www.metis.hu-berlin.de/wp-content/uploads/2020/03/Foto-Julien_Colomb-300x300.jpg",
        "https://metropol-berlin.de/wp-content/uploads/2022/09/TTMOEEU-Trondheim-by_Kendall_Rock-e1664273552909-700x600.jpg",
        "https://preview.redd.it/8nev70qop2g11.jpg?width=640&crop=smart&auto=webp&s=58757d208884308c7e63a6386413ee86527e4d49"]

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
  "Park am Gleisdreieck, Möckernstrasse 26, 10963 Berlin",
  "James-Simon-Park, Burgstraße 28, 10178 Berlin",
  "Invalidenpark, Invalidenstraße, 10115 Berlin",
  "Monbijoupark, Oranienburger Str., 10178 Berlin",
  "Park am Nordbahnhof, Gartenstraße 45, 13355 Berlin",
  "Berlin Innenstadt Park, Karl-Liebknecht-Str., 10178 Berlin",
  "Volkspark Mariendorf, Prühßstraße, 12105 Berlin",
  "Fritz-Schloß-Park, 10557 Berlin",
  "Volkspark Rehberge, Transvaalstraße 160, 13351 Berlin",
  "Britzer Garten, Sangerhauser Weg 1, 12349 Berlin",
  "Teich im Tiergarten, Str. des 17. Juni, 10557 Berlin",
  "Denkmal für Karl Liebknecht, Neuer See, 10787 Berlin",
  "Adlerbrücke, Str. des 17. Juni, 10785 Berlin",
  "Brandenburg Gate, Pariser Platz, 10117 Berlin",
  "Leise-Park, Heinrich-Roller-Straße 24, 10405 Berlin",
  "Märchenbrunnen, Am Friedrichshain, 10249 Berlin",
  "Mendelssohnstraße 28, 10405 Berlin",
  "13355 Berlin",
  "Friedrich-Ludwig-Jahn-Sportpark, Cantianstraße 24, 10437 Berlin"
]

event_url = [
  "https://berlin-beachvolleyball.de/wp-content/uploads/2019/08/3-1-740x555.jpg",
  "https://friedrichshainblog.de/wp-content/uploads/2014/05/Volleyball-Felder-Volkspark-Friedrichshain.jpg",
  "https://mitvergnuegen.com/wp-content/uploads/2017/06/goerli-600x338.jpeg",
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/25/fa/98/mauerpark.jpg?w=500&h=400&s=1",
  "https://media.tourispo.com/images/ecu/entity/e_sight/ausflugsziel_volkspark-friedrichshain_n2301-8326-2_l.jpg",
  "https://www.tip-berlin.de/wp-content/uploads/2022/05/imago0119743706h-scaled.jpg",
  "https://media.tourispo.com/images/ecu/entity/e_sight/ausflugsziel_volkspark-friedrichshain_n2301-7827-1_l.jpg",
  "https://www.tip-berlin.de/wp-content/uploads/2022/06/imago0119743229h-scaled.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/4/47/Berlin_Mauerpark_2022.jpg",
  "https://www.tripsavvy.com/thmb/3eZDu7mRSpMIyf90kiiVHR3IgZo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/BerlinMauerparkgrillGettyImages-908263008Giulio_dgr-5b5a31ebc9e77c00500e02d3.jpg",
  "https://www.berlin.de/binaries/asset/image_assets/6287711/source/1613558543/624x468/",
  "https://www.visitberlin.de/system/files/styles/visitberlin_hero_visitberlin_desktop_2x/private/image/tempelhoferfeld09_DL_PPT_0.jpg?h=06f6671c&itok=fpHpeMVl",
  "https://gruen-berlin.de/fileadmin/_processed_/1/f/csm_gb_projekte_parks_tempelhoferfeld_entwicklungbeteiligung_1_nutzungoderstrasse_c_manuelfrauendorf_d71a28262c.jpg",
  "https://www.tripsavvy.com/thmb/isDniPouKzQwXAlYU4pufW47_NI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/berlin-treptower-park-with-city-skyline-on-background--berlin--germany-1061231410-8c3951bcd7bc4f6eae82740e9aaf2601.jpg",
  "https://www.world-nomad.com/wn-uploads/Gorlitzer_park-420x315.jpg",
  "https://iam-blog-de.gumlet.io/blog/wp-content/uploads/2016/08/g%C3%B6rli1.jpg?compress=true&quality=80&w=400&dpr=2.6",
  "https://www.abenteuerfreundschaft.de/relaunch/wp-content/uploads/2016/06/parks-in-berlin-mauerpark.jpg",
  "https://www.palast.berlin/wp-content/uploads/2022/07/goerlitzerpark_felipe-tofani-e1658405918698.jpg",
  "https://www.visitberlin.de/system/files/styles/visitberlin_content_image_medium_visitberlin_mobile_1x/private/image/Sonnenuntergang_Tempelhofer_Feld.07_lbi_0.jpg?itok=4bqd4JLR",
  "https://jumpberlin.com/wp-content/uploads/2018/05/WhatsApp-Image-2018-04-17-at-16.06.48-1-1067x800.jpeg",
  "https://berlin-metropolitan.com/wp-content/uploads/sites/51/2023/02/berlin_gleisdreieck.jpg",
  "https://www.neubaukompass.com/bilder/objekt/13670/20-gross.jpg",
  "https://d.newsweek.com/en/full/1513086/treptower-park.jpg?w=790&f=6c156125097df2f48f6ffb4c79164b07"
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
    sport = ["football", "basketball", "volleyball", "tennis", "baseball", "badminton", "cricket", "rugby", "slackline",
             "paintball", "yoga", "running", "hiking", "softball", "ping pong", "parkour", "hockey", "frisbee", "handball",
             "swimming", "rowing", "quidditch", "cycling"]
    sport_type = sport.sample
    level = ["expert", "beginner", "intermediate"].sample
    event_image = URI.open(event_url[i % 13])
    time = [DateTime.new(2023, 2, 18, 14, 30, 0), DateTime.new(2023, 1, 3, 16, 0, 0), DateTime.new(2023, 3, 18, 9, 30, 0),
            DateTime.new(2023, 3, 4, 16, 20, 0), DateTime.new(2023, 4, 1, 10, 30, 0), DateTime.new(2023, 4, 3, 12, 0, 0),
            DateTime.new(2023, 3, 25, 13, 30, 0), DateTime.new(2023, 3, 28, 16, 15, 0), DateTime.new(2023, 3, 20, 10, 0, 0),
            DateTime.new(2023, 4, 2, 18, 30, 0), DateTime.new(2023, 3, 29, 7, 30, 0), DateTime.new(2023, 2, 10, 10, 0, 0),
            DateTime.new(2023, 3, 21, 18, 30, 0), DateTime.new(2023, 3, 18, 9, 0, 0), DateTime.new(2023, 3, 8, 9, 0, 0),
            DateTime.new(2023, 2, 1, 14, 30, 0), DateTime.new(2023, 4, 1, 15, 30, 0), DateTime.new(2023, 3, 24, 18, 30, 0),
            DateTime.new(2023, 3, 29, 14, 30, 0), DateTime.new(2023, 4, 4, 16, 20, 0), DateTime.new(2023, 3, 30, 11, 0, 0),
            DateTime.new(2023, 5, 1, 10, 30, 0), DateTime.new(2023, 3, 25, 10, 30, 0), DateTime.new(2023, 4, 2, 19, 30, 0),
            DateTime.new(2023, 3, 31, 18, 30, 0), DateTime.new(2023, 4, 5, 9, 0, 0), DateTime.new(2023, 3, 26, 8, 45, 0)]
           .sample

    event = Event.new(
      name: "#{sport_type.capitalize} Time",
      description: "I'm looking for #{sport_type} enthusiasts. If you are one of them. Please feel free to join our team. It will be #{level} friendly.",
      location: locations.sample,
      date: time,
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
  end
puts "Finished"
