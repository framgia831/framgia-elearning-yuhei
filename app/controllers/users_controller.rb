class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  
	def index
    @users = User.all
		
	end

	def show
		@user = User.find(params[:id])
    
	end

	def new
    @user = User.new
  end

  def create
    @user = User.new(
      user_params
      )
    if @user.save
    redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    # @user.name = params[:name]
    # @user.email = params[:email]
    # @user.image = params[:image]

    if @user.update_attributes(user_params)
      # @user.save
      flash[:notice] = "Success"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end

    def require_login
      unless current_user 
        flash[:notice] = "Please log in."
        redirect_to root_url
      end 
    end

end
