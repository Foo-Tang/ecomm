class Product < ApplicationRecord
  belongs_to :producttype

  has_many :wrestlerproducts
  has_many :wrestlers, through: :wrestlerproducts

  has_many :productorders
  has_many :orders, through: :productorders

  has_one_attached :image

  paginates_per 50

  validates :name, presence: true
  validates :price, numericality: true
  validates :stocklevel, numericality: { only_integer: true }
end
