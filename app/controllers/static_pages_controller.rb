class StaticPagesController < ApplicationController
def home
	if current_user 
		@actions = current_user.feed
		render "users/dashboard"

	end
end
end
