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

class Category < ApplicationRecord
  validates :name, :category_code, presence: true, uniqueness: true
  validates :category_code, length: { is: 2 }

  has_many :seat_configurations, dependent: :destroy
end
