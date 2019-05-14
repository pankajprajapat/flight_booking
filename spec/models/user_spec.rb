# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: 'user1@test.com') }

  it 'sets email correctly' do
    expect(user.email).to eq 'user1@test.com'
    expect(user.email).to be_present
  end

  it 'check normal user' do
    expect(user.admin).to eq false
  end

  it 'check admin user' do
    user = create(:user, email: 'admin@test.com', admin: true)
    expect(user.admin).to eq  true
  end
end
