class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  
	def index
    @users = User.all.page(params[:page]).per(6)
	end

	def show
		@user = User.find(params[:id])
    @lessons = @user.lessons
	end

	def new
    @user = User.new
  end

  def create
    @user = User.new(
      user_params
      )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Hurray! Successfully logged in!"
      redirect_to  user_url(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Success"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
    
  end

  def followers
    @followers = User.find(params[:id]).followers.page(params[:page]).per(6)
    ids = @followers.pluck(:follower_id)
    @users = User.where(id: ids).page(params[:page]).per(6)
    @title = "Followers List"

    render 'follow'
  end

  def following
    @following = User.find(params[:id]).following
    ids = @following.pluck(:followed_id)
    @users = User.where(id: ids).page(params[:page]).per(6)
    @title = "Following List"

    render 'follow'  
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
