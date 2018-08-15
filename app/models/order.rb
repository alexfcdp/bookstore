# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  has_many :order_items, dependent: :destroy
  has_one :credit_card, dependent: :destroy
  has_one :billing_address, class_name: BillingAddress.name, as: :addressable, dependent: :destroy
  has_one :shipping_address, class_name: ShippingAddress.name, as: :addressable, dependent: :destroy
  enum status: { in_progress: 0, in_queue: 1, in_delivery: 2, delivered: 3, canceled: 4 }
end
