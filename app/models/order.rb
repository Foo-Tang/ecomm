class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :orderstatus
  has_many :productorders
  has_many :product, through: :productorders
end
