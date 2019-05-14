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

require 'rails_helper'

RSpec.describe Plane, type: :model do
  let(:plane) { create(:plane, name: 'New Flight', plane_number: 'New123') }

  it 'check plane name' do
    expect(plane.name).to be_present
    expect(plane.name).to eq 'New Flight'
  end

  it 'check plane number' do
    expect(plane.plane_number).to be_present
    expect(plane.plane_number).to eq 'New123'
  end
end
