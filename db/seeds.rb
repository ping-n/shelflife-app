# require_relative 'data/foods'

puts 'Seeding Users'

user = User.create(email: 'daniel@gmail.com', password: 'password')
user2 = User.create(email: 'adrian@gmail.com', password: 'password')
user3 = User.create(email: 'ping@gmail.com', password: 'password')

puts 'Seeded Users'

puts 'Seeding Users'

fridge = Fridge.create(name: "Daniel's Fridge", user_id: 1)
fridge_2 = Fridge.create(name: "Daniel's Fridge", user_id: 2)

puts 'Seeded Users'

puts 'Seeding locations'

top_shelf = Location.create(name: 'Top Shelf', volume: 1000, fridge_id: 1)
bottom_shelf = Location.create(name: 'Bottom Shelf', volume: 1000, fridge_id: 1)
freeze = Location.create(name: 'Freezer', volume: 1000, fridge_id: 1)

top_shelf_2 = Location.create(name: 'Top Shelf', volume: 1000, fridge_id: 2)
bottom_shelf_2 = Location.create(name: 'Bottom Shelf', volume: 1000, fridge_id: 2)
freeze_2 = Location.create(name: 'Freezer', volume: 1000, fridge_id: 2)

puts 'Seeded Locations'

puts 'Seeding Foods'

5.times do |food|
  food = Food.create(name: Faker::Food.ingredient, opened: Time.now, expiry_after_open: '2020/07/19', volume: 100, user_id: 1, location_id: 2)
  puts "Generated #{food[:name]}"
end
