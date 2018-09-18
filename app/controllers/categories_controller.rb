class CategoriesController < ApplicationController
	def index
		categories_all = Category.all
		# users = User.where(id: current_user.id)
		lessons = Lesson.where(user_id: current_user.id)
		num = lessons.pluck(:category_id)
		categories_done = Category.where(id: num)

		@categories = categories_all - categories_done
	end
end
