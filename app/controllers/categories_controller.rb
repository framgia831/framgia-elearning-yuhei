class CategoriesController < ApplicationController
	def index
		@categories_all = Category.all
		# users = User.where(id: current_user.id)
		# lessons = Lesson.where(user_id: current_user.id)
		# num = lessons.pluck(:category_id)
		@categories_done = current_user.categories

		@categories = @categories_all - @categories_done
	end

	def show
		@category = Category.find(params[:id])
		lessons = @category.lessons
		@lesson = lessons.find_by(user_id: current_user.id)
		@answers = @lesson.answers
	end
end
