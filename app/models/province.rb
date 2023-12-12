class Province < ApplicationRecord
  has_many :customers

  validates :name, :abbr, presence: true
end
