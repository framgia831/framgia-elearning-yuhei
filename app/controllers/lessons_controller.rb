class LessonsController < ApplicationController
	def create
		@lesson = Lesson.create(
			user_id: current_user.id,
			category_id: params[:category_id]
			)
		redirect_to new_lesson_answer_url(@lesson.id)
	end	

end
