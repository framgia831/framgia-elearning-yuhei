class AnswersController < ApplicationController
	def new
		@lesson = Lesson.create(user_id: current_user.id, category_id: params[:category_id])
		# @category = Category.find(params[:category_id])
		@category = @lesson.category
		# @answer = @lesson.answers.build

		# words_all = Word.where(category_id: @category.id)	

		# @answers = @lesson.answers
		# .where(lesson_id: @lessons.ids)
		# num = answers.pluck(:lesson_id)
		# words_done = Word.where(id: num)	
		# if 
			@word = (@category.words - @lesson.words).first 
			abort

			# @choices = @word.choices	
		# end	
		# abort
	end 

	def create
		answer = Answer.new(
			lesson_id: params[:lesson_id],
			word_id: params[:word_id],
			choice_id: params[:choice_id]
			)


		if answer.save
			redirect_to new_category_answer_path(params[:category_id])
	    else
	    	redirect_to category_answers_path(params[:category_id])
	    end	



	end
end
