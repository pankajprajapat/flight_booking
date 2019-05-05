# == Schema Information
#
# Table name: planes
#
#  id           :bigint           not null, primary key
#  name         :string
#  plane_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PlaneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
