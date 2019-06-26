class BorrowsController < ApplicationController
  before_action :find_borrow, only: %i(update)

  def update
    if @borrow.update status: "pending"
      flash[:success] = t "update_success"
      redirect_to books_path
    else
      flash[:info] = t "update_failure"
      redirect_back fallback_location: root_path
    end

  end

  private
    def find_borrow
      return if @borrow = Borrow.find_by(id: params[:borrow_id])
      render "layouts/notfound"
    end
end
