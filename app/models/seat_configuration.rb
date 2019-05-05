# == Schema Information
#
# Table name: seat_configurations
#
#  id             :bigint           not null, primary key
#  plane_id       :bigint
#  category_id    :bigint
#  seats_in_row   :integer
#  number_of_rows :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class SeatConfiguration < ApplicationRecord
  validates_presence_of :plane
  validates :category_id, :seats_in_row, :number_of_rows, :base_price, presence: true
  validates :seats_in_row, :number_of_rows, :base_price, numericality: { only_integer: true }

  belongs_to :plane
  belongs_to :category
end
