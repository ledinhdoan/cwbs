class Coupon < ApplicationRecord
  has_many :invoices

  belongs_to :quantity
  belongs_to :space
  belongs_to :booking_type

  validates :amount, presence: true
  validates :coupon_type, presence: true
end
