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

require 'rails_helper'

RSpec.describe SeatConfiguration, type: :model do
  let(:seat_configuration) { create(:seat_configuration) }

  it 'check plane is present' do
    expect(seat_configuration.plane).to be_present
  end

  it 'check category is present' do
    expect(seat_configuration.category).to be_present
  end

  it 'check seats in row' do
    expect(seat_configuration.seats_in_row).to be_present
    expect(seat_configuration.seats_in_row).to eq 3
  end

  it 'check number of rows' do
    expect(seat_configuration.number_of_rows).to be_present
    expect(seat_configuration.number_of_rows).to eq 10
  end

  it 'check base price' do
    expect(seat_configuration.base_price).to be_present
    expect(seat_configuration.base_price).to eq 1000
  end
end
