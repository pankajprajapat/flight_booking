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

class Plane < ApplicationRecord
  validates :name, presence: true
  validates :plane_number, presence: true, uniqueness: true

  has_one :flight, dependent: :destroy
  has_many :seat_configurations, dependent: :destroy

  accepts_nested_attributes_for :seat_configurations, allow_destroy: true

  scope :without_flight, -> do
    left_outer_joins(:flight).where(flights: { id: nil })
  end

  def full_name
    "#{name} / #{plane_number}"
  end
end
