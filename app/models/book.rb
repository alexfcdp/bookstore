# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :reviews, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories  
  has_many :order_items, dependent: :destroy
  has_many_attached :images
end
