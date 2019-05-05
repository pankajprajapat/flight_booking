admin_users = User.create(id: 1, email: "admin@test.com", password: "password", password_confirmation: "password", admin: true)

test_users  = User.create([{email: "user1@test.com", password: "password", password_confirmation: "password"},
                           {email: "user2@test.com", password: "password", password_confirmation: "password"},
                           {email: "user3@test.com", password: "password", password_confirmation: "password"}])

categories = Category.create([{ id: 1, name: 'First Class'}, { id: 2, name: 'Business class'}, { id: 3, name: 'Economy class'} ])

planes = Plane.create([
  { id: 1, name: "Airbus A380", plane_number: "TestA380", seat_configurations_attributes: { "0"=> { category_id: 1, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..10000)}, "1"=> { category_id: 2, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..10000)}, "2"=> {category_id: 3, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..10000)}}},
  { id: 2, name: "Boeing 747", plane_number: "Test747", seat_configurations_attributes: { "0"=> { category_id: 1, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..10000)}, "1"=> { category_id: 2, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..10000)}, "2"=> {category_id: 3, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..10000)}}}
])
