class CategoriesController < ApplicationController
	def index
		@categories_all = Category.all
		@learned = params[:learned] || ""

		if @learned == "1"
			@categories = current_user.categories
		elsif @learned == "0"
			@categories = Category.where.not(id: current_user.category_ids)
		else
			@categories = @categories_all
		end	
		@categories = @categories.joins(:words).group(:id).page(params[:page]).per(4)
	end

	def show
		@lesson = current_user.lessons.find_by(category_id: params[:id])
		redirect_to  lesson_answers_path(@lesson)
	end
end
