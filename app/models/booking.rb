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

class Booking < ApplicationRecord
  before_validation :set_pnr_number
  before_validation :set_total_fare, if: proc { |attr| attr.total_fare.blank? }

  validates :user, :flight, :seat_configuration, :row_number, :seat_number, :total_fare, presence: true
  validate :check_seat_upgrade, on: :update
  validate :check_duplicate_booking

  belongs_to :user
  belongs_to :flight
  belongs_to :seat_configuration, foreign_key: :seat_configuration_id

  scope :booked_seats, -> (seat_configuration_id, row_number) { where(seat_configuration_id: seat_configuration_id, row_number: row_number) }

  private

  def set_pnr_number
    category_code = self.seat_configuration.try(:category).try(:category_code)
    rn = Array.new(6){rand(6)}.join

    self.pnr_number = "#{category_code}#{rn}" if self.changed?
  end

  def set_total_fare
    self.total_fare = self.seat_configuration.try(:base_price)
  end

  def check_seat_upgrade
    if self.total_fare.to_f < self.total_fare_was.to_f
      errors.add(:total_fare, "can't be lesser than privious value.")
    end
  end

  def check_duplicate_booking
    booking = Booking.where(seat_configuration_id: self.seat_configuration_id, row_number: self.row_number, seat_number: self.seat_number).first
    if booking && booking.id != self.id
      errors.add(:base, "You can't book this seat, someone already booked this seat.")
    end
  end
end
