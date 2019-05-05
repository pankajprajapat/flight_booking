# == Schema Information
#
# Table name: seat_configurations
#
#  id             :bigint           not null, primary key
#  plane_id       :bigint
#  category_id    :bigint
#  seats_in_row   :integer
#  number_of_rows :integer
#  base_price     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class SeatConfigurationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
