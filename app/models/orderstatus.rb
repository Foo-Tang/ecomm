class Orderstatus < ApplicationRecord
  has_many :orders

  validates :status, presence: true
  def display_name
    status
  end
end
