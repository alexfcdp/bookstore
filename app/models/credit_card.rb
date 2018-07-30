# frozen_string_literal: true

class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
end
