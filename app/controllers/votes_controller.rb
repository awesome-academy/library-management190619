class VotesController < ApplicationController
  def create
    @book = Book.find_by id: params[:book_id]
    @book.liked_by current_user
    respond_to do |format|
      format.html{redirect_to @book}
      format.js{render :vote}
    end
  end

  def destroy
    @book = Book.find_by id: params[:book_id]
    @book.liked_by current_user
    respond_to do |format|
      format.html{redirect_to @book}
      format.js{render :vote}
    end
  end
end
