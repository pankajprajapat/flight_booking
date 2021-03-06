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

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  context 'validations' do
     it { should validate_presence_of(:name) }
     it { should allow_nil(:address) }
   end

   context 'associations' do
     it { should belong_to(:industry) }
     it { should have_many(:sub_sectors).dependent(:restrict_with_exception) }
   end
end
