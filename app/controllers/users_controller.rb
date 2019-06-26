class UsersController < ApplicationController
  before_action :find_author, only: %i(follow_author unfollow_author)

  def follow_author
    current_user.follow @author
    respond_to do |format|
      format.html{redirect_to @author}
    end
  end

  def unfollow_author
    current_user.stop_following @author
    respond_to do |format|
      format.html{redirect_to @author}
    end
  end

  private
    def find_author
      return if @author = Author.find_by(id: params[:id])
      render "layout/notfound"
    end
end
