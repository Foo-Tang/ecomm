class Orderstatus < ApplicationRecord
  has_many :orders

  def display_name
    status
  end
end
