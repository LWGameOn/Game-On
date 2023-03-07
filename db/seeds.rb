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


i = 0
  20.times do
    user = User.all.sample
    sport = ["football", "basketball", "volleyball", "tennis", "baseball"]
    sport_type = sport.sample
    level = ["advance", "beginner", "intermediate"].sample
   Event.create(
     name: "#{sport_type.capitalize} Time",
     description: "I'm looking for #{sport[i]} enthusiasts. If you are one of them. Please feel free to join our team. It will be #{level} friendly.",
     location: Faker::Address.full_address,
     date: Faker::Date.forward(days: 365),
     time: Faker::Time.forward(days: 23, format: :long).split(" ")[3],
     capacity: rand(2..20),
     sport: sport_type,
     user_id: user.id
   )
   i += 1
  end
  puts "Finished"
