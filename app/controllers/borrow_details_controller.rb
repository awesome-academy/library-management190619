class BorrowDetailsController < ApplicationController
  before_action :find_borrow, only: %i(index)
  before_action :find_book, only: %i(create)

  def index
    @borrow_details = @borrow.borrow_details
  end

  def create
    current_user.borrow borrow_detail_params
    respond_to do |format|
      format.html{redirect_to @book}
    end
  end

  def destroy
    current_user.unborrow params[:book_id]
    respond_to do |format|
      format.html{redirect_back fallback_location: root_path}
    end
  end

  private
    def borrow_detail_params
      params.require(:borrow_detail).permit BorrowDetail::BORROW_DETAILS_PARAMS
    end

    def find_book
      return if @book = Book.find_by(id: params.require(:borrow_detail)[:book_id])
      render "layouts/notfound"
    end

    def find_borrow
      return if @borrow = current_user.borrows.find_by(Borrow::CONDITION_BORROWING)
      @borrow = current_user.borrows.create Borrow::CONDITION_BORROWING
    end
end
