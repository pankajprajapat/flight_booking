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

class Flight < ApplicationRecord

  belongs_to :plane
  validates :plane, :origin, :destination, presence: true
  has_many :bookings, dependent: :destroy
  has_many :seat_configurations, through: :plane
end
