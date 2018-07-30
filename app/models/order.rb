# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card
  has_many :order_items, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
end
