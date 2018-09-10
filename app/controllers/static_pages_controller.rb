class StaticPagesController < ApplicationController
def home
	if current_user
		render "users/dashboard"
	end
end
end
