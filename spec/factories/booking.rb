FactoryGirl.define do
  factory :booking do
    user
    flight
    seat_configuration
    row_number '1'
    seat_number '1'
    pnr_number 'FC345323'
    total_fare '1000'
  end
end
