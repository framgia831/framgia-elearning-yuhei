class AnswersController < ApplicationController
	def new
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category
	
		@word = (@category.words - @lesson.words).first 
	end 

	def index
		@lesson = Lesson.find(params[:lesson_id])
		@answers = @lesson.answers
	end

	def create
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category

		answer = @lesson.answers.build(
			word_id: params[:word_id],
			choice_id: params[:choice_id]
			)

		answer.save
		word = (@category.words - @lesson.words).first 
		if word 
			redirect_to new_lesson_answer_url(@lesson)
		else
			@lesson.create_activity(user_id: current_user.id)	
    		redirect_to lesson_answers_url(@lesson)
			
		end
	end
	
end
