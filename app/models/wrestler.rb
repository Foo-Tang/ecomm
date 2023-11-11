class Wrestler < ApplicationRecord

  has_many :wrestlerproducts
  has_many :products, through: :wrestlerproducts
end
