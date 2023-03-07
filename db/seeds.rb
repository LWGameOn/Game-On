require 'faker'
Event.destroy_all
User.destroy_all


#
20.times do
  User.create(
    email: Faker::Internet.email,
    password: "gameon1312",
    username: Faker::Internet.username
    )
end



  20.times do
    user = User.all.sample
    sport = ["football", "basketball", "volleyball", "tennis", "baseball", "badminton", "cricket", "rugby"].sample
    level = ["advance", "beginner", "intermediate"].sample
    location = Faker::Address.full_address
   Event.create(
     name: "#{sport} at #{location}",
     description: "I'm looking for #{sport} enthusiasts. If you are one of them. Please feel free to join our team. It will be #{level} friendly.",
     location: location,
     date: Faker::Date.forward(days: 365),
     time: Faker::Time.forward(days: 23, format: :long).split(" ")[3],
     capacity: rand(2..20),
     sport: sport,
     user_id: user.id
   )
  end
