require_relative 'data/foods'

puts 'Seeding Users'

user = User.create(email: 'daniel@gmail.com', password: 'password')
user2 = User.create(email: 'adrian@gmail.com', password: 'password')
user3 = User.create(email: 'ping@gmail.com', password: 'password')

puts 'Seeded Users'

puts 'Seeding Fridges'

fridge = Fridge.create(name: "Daniel's Fridge", user_id: 1)
fridge_2 = Fridge.create(name: "Adrian's Fridge", user_id: 2)

puts 'Seeded Fridges'

puts 'Seeding locations'

top_shelf = Location.create(name: 'Top Shelf', volume: 1000, fridge_id: 1)
bottom_shelf = Location.create(name: 'Bottom Shelf', volume: 1000, fridge_id: 1)
freeze = Location.create(name: 'Freezer', volume: 1000, fridge_id: 1)

top_shelf_2 = Location.create(name: 'Top Shelf', volume: 1000, fridge_id: 2)
bottom_shelf_2 = Location.create(name: 'Bottom Shelf', volume: 1000, fridge_id: 2)
freeze_2 = Location.create(name: 'Freezer', volume: 1000, fridge_id: 2)

puts 'Seeded Locations'

puts 'Seeding Foods'

foods.each do |food|
  food = Food.create(food)
  puts "Created #{food[:name]}"
end
puts 'Seeded Foods'