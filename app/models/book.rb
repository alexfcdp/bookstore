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
  validates :images, file_size: { less_than_or_equal_to: 1.megabyte, message: 'Images should be less than %{count}'},
                     file_content_type: {allow: ['image/jpeg','image/png'], message: 'Images only allows jpeg and png'}

  def properties
    "H:#{dimensions[:height]}\" x W:#{dimensions[:width]}\" x D:#{dimensions[:depth]}"
  end

  # private

  # def image_type
  #   images.each do |image|
  #     unless image.content_type.in?(%w[image/png image/jpeg])
  #       errors.add(:images, 'Image needs to be a JPEG or PNG')
  #       images.purge_later
  #     end
  #   end
  # end
end
