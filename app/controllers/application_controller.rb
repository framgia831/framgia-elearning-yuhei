class ApplicationController < ActionController::Base
	include SessionsHelper
	def set_current_user
		@current_user = User.current_user
	end
end
