class Admin::UsersController < ApplicationController
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
end
