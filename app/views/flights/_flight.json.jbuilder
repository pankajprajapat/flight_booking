json.extract! flight, :id, :plane_id, :origin, :destination, :created_at, :updated_at
json.url flight_url(flight, format: :json)
