module UsersHelper
	def user_image(user)
	    path = user.image? ? user.image.url : "default.jpg"
	    image_tag(path)
	end
		
	
end
