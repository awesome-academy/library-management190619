class VotesController < ApplicationController
  def create
    @book = Book.find_by id: params[:id]
    @book.liked_by current_user
    respond_to do |format|
      format.html{redirect_to @post}
      format.js{render :vote}
    end
  end

  def destroy
    @book = Book.find_by id: params[:id]
    @book.liked_by current_userr
    respond_to do |format|
      format.html{redirect_to @post}
      format.js{render :vote}
    end
  end
end
