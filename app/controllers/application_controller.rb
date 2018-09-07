class ApplicationController < ActionController::Base
	def set_current_user
		@current_user = User.current_user
	end
end
