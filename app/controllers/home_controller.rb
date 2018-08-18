class HomeController < ApplicationController
  def index
    @lattest_books = Book.last(3).reverse
    @best_sellers = Book.first(4)
  end
end
