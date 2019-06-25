class SessionsController < Devise::SessionsController
  def new
    get_pre_login_url
    super
  end

  def create
    get_pre_login_url
    super
  end

  def destroy
    @referer_url = root_path
    super
  end

  def after_sign_in_path_for resource
    return unless current_user.is_admin?
    @referer_url = admin_static_pages_path
  end

  private
    def get_pre_login_url
      @referer_url = root_path
    end
end
