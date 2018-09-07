class UsersController < ApplicationController
	def index
		
	end

	def show
		@user = User.find(params[:id])
	end

	def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
      )

    if @user.save
    redirect_to user_url(@user)
    else
      render 'new'
    end
     
  end

end
