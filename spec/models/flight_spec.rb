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

require 'rails_helper'

RSpec.describe Flight, type: :model do
  let(:flight) { create(:flight) }

  it 'check plane is present' do
    expect(flight.plane).to be_present
  end

  it 'check origin' do
    expect(flight.origin).to be_present
    expect(flight.origin).to eq 'Jaipur'
  end

  it 'check destination' do
    expect(flight.destination).to be_present
    expect(flight.destination).to eq 'Mumbai'
  end
end
