admin_users = User.create(id: 1, email: "admin@test.com", password: "password", password_confirmation: "password", admin: true)

test_users  = User.create([{email: "user1@test.com", password: "password", password_confirmation: "password"},
                           {email: "user2@test.com", password: "password", password_confirmation: "password"},
                           {email: "user3@test.com", password: "password", password_confirmation: "password"}])

categories = Category.create([{ id: 1, name: 'First Class', category_code: 'FC'}, { id: 2, name: 'Business class', category_code: 'BC'}, { id: 3, name: 'Economy class', category_code: 'EC'} ])

planes = Plane.create([
  { id: 1, name: "Airbus A380", plane_number: "TestA380", seat_configurations_attributes: { "0"=> { category_id: 1, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..4000)}, "1"=> { category_id: 2, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(4000..6000)}, "2"=> {category_id: 3, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(6000..10000)}}},
  { id: 2, name: "Boeing 747", plane_number: "Test747", seat_configurations_attributes: { "0"=> { category_id: 1, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..4000)}, "1"=> { category_id: 2, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(4000..6000)}, "2"=> {category_id: 3, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(6000..10000)}}},
  { id: 3, name: "Airbus A380", plane_number: "AirA380", seat_configurations_attributes: { "0"=> { category_id: 1, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(1000..4000)}, "1"=> { category_id: 2, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(4000..6000)}, "2"=> {category_id: 3, seats_in_row: rand(1..6), number_of_rows: rand(1..10), base_price: rand(6000..10000)}}}
])

flights = Flight.create([{ id: 1, plane_id: 1, origin: 'Jaipur', destination: 'Delhi'}, { id: 2, plane_id: 2, origin: 'Bangalore', destination: 'Mumbai' }, { id: 3, plane_id: 3, origin: 'Chandigarh', destination: 'Kolkata' }])

bookings = Booking.create!([
  { id: 1, user_id: 2, flight_id: 1, seat_configuration_id: 1, row_number: 1, seat_number: 1 },
  { id: 2, user_id: 2, flight_id: 1, seat_configuration_id: 2, row_number: 1, seat_number: 1 },
  { id: 3, user_id: 2, flight_id: 1, seat_configuration_id: 3, row_number: 1, seat_number: 1 },
  { id: 4, user_id: 3, flight_id: 2, seat_configuration_id: 4, row_number: 1, seat_number: 1 },
  { id: 5, user_id: 3, flight_id: 2, seat_configuration_id: 5, row_number: 1, seat_number: 1 },
  { id: 6, user_id: 3, flight_id: 2, seat_configuration_id: 6, row_number: 1, seat_number: 1 },
  { id: 7, user_id: 4, flight_id: 3, seat_configuration_id: 7, row_number: 1, seat_number: 1 },
  { id: 8, user_id: 4, flight_id: 3, seat_configuration_id: 8, row_number: 1, seat_number: 1 },
  { id: 9, user_id: 4, flight_id: 3, seat_configuration_id: 9, row_number: 1, seat_number: 1 }
])
