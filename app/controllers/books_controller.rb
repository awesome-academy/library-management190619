class BooksController < ApplicationController
  before_action :find_book, only: %i(show)

  def index
    @books = Book.first(Settings.number_of_books_to_show)
  end
  def show
    @comment = Comment.new
  end

  private
    def find_book
      return if @book = Book.find_by(id: params[:id])
      render "layout/notfound"
    end
end
