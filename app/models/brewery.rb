class Brewery < ApplicationRecord
  has_many :beers

  validates :name, uniqueness: true
end
