class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:session][:email])		
		if user && user.authenticate(params[:session][:password]) 
			session[:user_id] = user.id
			flash[:notice] = "Hurray! Successfully logged in!"
			redirect_to  user_url(user)

		else
			flash[:notice] = "Invalid information."
			render 'new'
		end

	end
	def destroy
		session.delete(:user_id)
		flash[:notice] = "Successfully logged out."
		redirect_to root_url
	end
end
