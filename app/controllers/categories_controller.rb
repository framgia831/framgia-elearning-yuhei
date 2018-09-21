class CategoriesController < ApplicationController
	def index
		@categories_all = Category.all
		@categories = @categories_all - current_user.categories

    	@categories_page = Category.page(params[:page]).per(5)

	end

	def show
		@lesson = current_user.lessons.find_by(category_id: params[:id])
	
		# @answers = @lesson.answers
		redirect_to  lesson_answers_path(@lesson)
	end
end
