class StaticPagesController < ApplicationController
def home
	if current_user 
		@activities = current_user.feed
		render "users/dashboard"

	end
end
end
