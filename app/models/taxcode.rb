class Taxcode < ApplicationRecord
  validates :province, presence: true
  validates :pst, :hst, :gst, :applicable, numericality: true
end
