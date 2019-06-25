module Admin
  class UsersController < AdminBaseController
    before_action :find_user, only: %i(destroy grant_admin)

    def index
      @q = User.ransack(params[:q])
      @users = @q.result.page(params[:page]).per(Settings.items_per_page)
    end

    def destroy
      if @user.destroy
        flash[:success] = t "delete_success"
      else
        flash[:danger] = t "delete_failure"
      end
      redirect_to admin_users_url
    end

    def update
      if @user.update is_admin: true
        flash[:success] = t "update_success"
      else
        flash[:info] = t "update_failure"
      end
      redirect_to admin_users_url
    end

    private
      def find_user
        return if @user = User.find_by(id: params[:id])
        render "layouts/notfound"
      end
  end
end
