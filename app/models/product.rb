class Product < ApplicationRecord
  belongs_to :producttype

  has_many :wrestlerproducts
  has_many :wrestler, through: :wrestlerproducts
end
