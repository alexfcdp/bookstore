# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  enum status: { unprocessed: 0, approved: 1, rejected: 2 }
  scope :unprocessed, -> { where(status: :unprocessed) }
  scope :others_status, -> { where(status: %i[approved rejected]) }

  validates :status, presence: true
end
