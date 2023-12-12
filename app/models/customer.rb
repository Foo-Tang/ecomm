class Customer < ApplicationRecord
  has_many :orders
  belongs_to :province

  validates :name, :address, :postal_code, presence: true
end
