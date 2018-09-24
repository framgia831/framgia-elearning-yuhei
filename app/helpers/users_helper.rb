module UsersHelper
	def user_image(user, options = {class: "img"})
	    path = user.image? ? user.image.url : "default.jpg"
	    image_tag(path, options)
	end
		
	
end
