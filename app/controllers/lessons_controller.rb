class LessonsController < ApplicationController
	def create
		@lesson = Lesson.create(
			user_id: current_user.id,
			category_id: params[:category_id]
			)
		redirect_to new_lesson_answer_url(@lesson.id)
	end	

	def word
		category_first = current_user.categories.first
		@category_id = params[:category_id] || category_first

		@answers = current_user.answers.page(params[:page]).per(7)

		@answers = Category.all.find(@category_id.to_i).answers
	end

	
end
