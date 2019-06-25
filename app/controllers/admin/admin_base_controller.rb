class Admin::AdminBaseController < ApplicationController
  before_action :admin_user
  layout "application_admin"
end
