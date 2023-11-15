class Wrestler < ApplicationRecord
  has_many :wrestlerproducts
  has_many :products, through: :wrestlerproducts

  validates :name, presence: true
end
