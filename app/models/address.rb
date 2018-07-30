# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :country
end
