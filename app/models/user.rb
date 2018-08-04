# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :billing_address, class_name: BillingAddress.name, as: :addressable, dependent: :destroy
  has_one :shipping_address, class_name: ShippingAddress.name, as: :addressable, dependent: :destroy
  has_one_attached :avatar
end
