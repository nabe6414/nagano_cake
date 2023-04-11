class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_datails, dependent: :destroy

  validates :postal_code, length: { is: 7 }
  validates :address, presence: true
  validates :name, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { not_payment: 0, payment: 1, manufacture: 2, shipping_preparation: 3, shipped: 4 }
end
