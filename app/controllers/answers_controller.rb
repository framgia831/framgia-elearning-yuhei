class AnswersController < ApplicationController
	def new
		# @lesson = Lesson.create(user_id: current_user.id, category_id: params[:category_id])
		# @category = Category.find(params[:category_id])
		@lesson = Lesson.find(params[:lesson_id])
		@category = @lesson.category
		# @answer = @lesson.answers.build

		# words_all = Word.where(category_id: @category.id)	

		# @answers = @lesson.answers.where(lesson_id: @lessons.ids)
		# num = answers.pluck(:lesson_id)
		# words_done = Word.where(id: num)	

		@word = (@category.words - @lesson.words).first 
		# @choices = @word.choices	
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
    		redirect_to lesson_answers_url(@lesson)
			
		end
	    



	end
end
