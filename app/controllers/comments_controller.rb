class CommentsController < ApplicationController
  before_action :find_comment, only: %i(destroy)

  def create
    @comment = Comment.new comment_params
    if @comment.save
      flash[:success] = t "create_success"
    else
      flash[:info] = t "create_failure"
    end
    redirect_back fallback_location: root_path
  end

  def destroy; end

  private
    def comment_params
      params.require(:comment).permit(Comment::COMMENT_PARAMS).merge(user_id: current_user.id)
    end

    def find_comment
      return if @comment = Comment.find_by(id: params[:id])
      render "layout/notfound"
    end
end
