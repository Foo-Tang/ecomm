class Order < ApplicationRecord
  belongs_to :customer

  has_many :productorders
  has_many :product, through: :productorders
end
