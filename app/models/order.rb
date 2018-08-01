# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card
  has_many :order_items, dependent: :destroy
  has_one :billing_address, class_name: BillingAddress.name, as: :addressable, dependent: :destroy
  has_one :shipping_address, class_name: ShippingAddress.name, as: :addressable, dependent: :destroy
end
