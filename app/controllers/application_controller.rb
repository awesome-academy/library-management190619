class ApplicationController < ActionController::Base
  def admin_user
    redirect_to root_url unless current_user.is_admin?
  end
end
