class Product < ApplicationRecord
  belongs_to :producttype

  has_many :wrestlerproducts
  has_many :wrestler, through: :wrestlerproducts

  has_many :productorders
  has_many :order, through: :productorders

  has_one_attached :image

  paginates_per 50
end
