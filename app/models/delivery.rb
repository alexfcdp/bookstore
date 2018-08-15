# frozen_string_literal: true

class Delivery < ApplicationRecord
  serialize :terms
  has_many :orders, dependent: :nullify
end
