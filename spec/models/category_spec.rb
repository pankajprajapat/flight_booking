# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_code :string
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category, name: 'Business Class', category_code: 'BC') }

  it 'check category name' do
    expect(category.name).to be_present
    expect(category.name).to eq 'Business Class'
  end

  it 'check category code' do
    expect(category.category_code).to be_present
    expect(category.category_code).to eq 'BC'
  end
end
