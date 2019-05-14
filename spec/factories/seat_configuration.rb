FactoryGirl.define do
  factory :seat_configuration do
    plane
    category
    seats_in_row '3'
    number_of_rows '10'
    base_price '1000'
  end
end
