class CategoriesController < ApplicationController
	def index
		@categories_all = Category.all.page(params[:page]).per(4)
	
		if params[:learned] == 1.to_s
			@categories = current_user.categories
		elsif params[:learned] == 0.to_s
			@categories = @categories_all - current_user.categories
		else
			@categories = @categories_all
		end	
				
			


	end

	def show
		@lesson = current_user.lessons.find_by(category_id: params[:id])
		redirect_to  lesson_answers_path(@lesson)
	end
end
