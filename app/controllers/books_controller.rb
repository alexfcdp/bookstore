# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @services = BookFilterServices.new(params)
    @books = @services.catalog_with_category
  end

  def show
    @book = Book.find_by(id: params[:id]).decorate
    @reviews = @book.reviews.approved.decorate
  end
end
