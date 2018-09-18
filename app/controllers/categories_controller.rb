class CategoriesController < ApplicationController
	def index
		@categories_all = Category.all
	

		@categories = @categories_all - current_user.categories
	end

	def show
		@lesson = current_user.lessons.find_by(category_id: params[:id])
	
		@answers = @lesson.answers
	end
end
