# == Schema Information
#
# Table name: bookings
#
#  id                    :bigint           not null, primary key
#  user_id               :bigint
#  flight_id             :bigint
#  seat_configuration_id :bigint
#  row_number            :integer
#  seat_number           :integer
#  pnr_number            :string
#  total_fare            :float
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:booking) { create(:booking) }
end
