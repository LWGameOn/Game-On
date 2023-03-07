Event.destroy_all
User.destroy_all


#
20.times do
  User.new(
    email: Faker::Internet.email,
    password: "gameon1312",
    username: Faker::Internet.username
    ).save
end



  20.times do
    user = User.all.sample
    sport = Faker::Sports
    level = ["advance", "begginer","intermediate"].sample
   Event.new(
     name:sport,
     description: "I'm looking for #{sport} enthusiasts. If you are one of them. Please feel free to join our team. It will be #{level} friendly.",
     location: Faker::Address.full_address,
     date: Faker::Date.forward(days: 365),
     time: Faker::Time.forward(days: 23, format: :long).split(" ")[3],
     capacity: rand(2..20),
     sport: Faker::Sports
   ).save
  end
