# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true
  belongs_to :country

  validates :firstname, :lastname, :address, :city, :zip, :phone, presence: true
end
