require_relative 'data/foods'
require_relative 'data/locations'

puts 'Seeding Users'
p "--" * 17
user = User.create(email: 'daniel@gmail.com', password: 'password')
puts "Created User 1"
user2 = User.create(email: 'adrian@gmail.com', password: 'password')
puts "Created User 2"
user3 = User.create(email: 'ping@gmail.com', password: 'password')
puts "Created User 3"
p "--" * 17
puts 'Seeded Users'
p "--" * 17

puts 'Seeding Fridges'
p "--" * 17
fridge = Fridge.create(name: "Daniel's Fridge", user_id: 1)
puts "Created #{fridge[:name]}"
fridge_2 = Fridge.create(name: "Adrian's Fridge", user_id: 2)
puts "Created #{fridge_2[:name]}"
fridge_3 = Fridge.create(name: "Ping's Fridge", user_id: 3)
puts "Created #{fridge_3[:name]}"
p "--" * 17
puts 'Seeded Fridges'
p "--" * 17

puts 'Seeding locations'
p "--" * 17
locations.each do |location|
  location = Location.create(location)
  puts "Created #{location[:name]}"
end
p "--" * 17
puts 'Seeded Locations'
p "--" * 17
puts 'Seeding Foods'
p "--" * 17
foods.each do |food|
  food = Food.create(food)
  puts "Created #{food[:name]}"
end
p "--" * 17
puts 'Seeded Foods'
p "--" * 17
puts "Seeding was successful!"