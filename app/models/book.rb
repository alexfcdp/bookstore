# frozen_string_literal: true

class Book < ApplicationRecord
  serialize :dimensions
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :reviews, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories
  has_many :order_items, dependent: :destroy
  has_many_attached :images
  attr_accessor :height, :width, :depth
  validates :height, :width, :depth, numericality: true, allow_blank: true
  validate :image_type

  def properties
    "H:#{dimensions[:height]}\" x W:#{dimensions[:width]}\" x D:#{dimensions[:depth]}"
  end

  private

  def image_type
    images.each do |image|
      unless image.content_type.in?(%w[image/png image/jpeg])
        errors.add(:images, 'Image needs to be a JPEG or PNG')
        images.purge_later
      end
    end
  end
end
