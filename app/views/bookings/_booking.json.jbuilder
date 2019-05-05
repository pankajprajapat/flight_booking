json.extract! booking, :id, :user_id, :flight_id, :pnr_number, :total_fare, :created_at, :updated_at
json.url booking_url(booking, format: :json)
