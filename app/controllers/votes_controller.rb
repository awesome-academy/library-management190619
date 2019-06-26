class VotesController < ApplicationController
  before_action :find_book, only: %i(create destroy)

  def create
    @book.liked_by current_user
    respond_to do |format|
      format.html{redirect_to @book}
      format.js{render :vote}
    end
  end

  def destroy
    @book.disliked_by current_user
    respond_to do |format|
      format.html{redirect_to @book}
      format.js{render :vote}
    end
  end

  private
    def find_book
      return if @book = Book.find_by(id: params[:book_id])
      render "layouts/notfound"
    end
end
