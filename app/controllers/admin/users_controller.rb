class Admin::UsersController < ApplicationController
  before_action :require_admin, except: [:update, :destroy]
  def index
  	@users = User.all.page(params[:page]).per(5)
  end

   def update
    @user = User.find(params[:id])
    @user.update_attribute(:admin, true)
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.update_attribute(:admin, false)
    redirect_to admin_users_path
  end

  private
  def require_admin
    unless current_user.admin?
      flash[:notice] = "You are not admin."
      redirect_to root_url
    end
  end

end
