json.extract! seat_configuration, :id, :plane_id, :category_id, :seats_in_row, :number_of_rows, :created_at, :updated_at
json.url seat_configuration_url(seat_configuration, format: :json)
