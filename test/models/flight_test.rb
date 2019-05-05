# == Schema Information
#
# Table name: flights
#
#  id          :bigint           not null, primary key
#  plane_id    :bigint
#  origin      :string
#  destination :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
