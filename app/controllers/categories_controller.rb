class CategoriesController < ApplicationController
	def index
		@categories_all = Category.all.page(params[:page]).per(4)
		@categories = @categories_all - current_user.categories
	end

	def show
		@lesson = current_user.lessons.find_by(category_id: params[:id])
		redirect_to  lesson_answers_path(@lesson)
	end
end
