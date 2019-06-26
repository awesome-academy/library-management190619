class BooksController < ApplicationController
  include BooksHelper
  before_action :find_book, only: %i(show)

  def index
    category_id = params[:category_id]
    @categories = Category.sub_category category_id
    if @categories.blank?
      @categories = Category.find_by(id: category_id)
    end

    @q = Book.ransack(params[:q])
    @books = @q.result.includes(:category).page(params[:page])
      .per(Settings.items_per_page)
  end

  def show
    @comment = Comment.new
    @comments = Comment.last(Settings.number_of_comments_to_show)
    @borrow_detail = BorrowDetail.new
  end

  private
    def find_book
      return if @book = Book.find_by(id: params[:id])
      render "layout/notfound"
    end
end
