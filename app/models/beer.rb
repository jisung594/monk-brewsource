class Beer < ApplicationRecord
  has_many :users
  has_many :users, through: :reviews
  # belongs_to :brewery

  validates :name, uniqueness: true
end
