class Admin::WordsController < ApplicationController
	before_action :admin_user

	def index
		@category = Category.find(params[:category_id])
		@words = Word.all
		@i = 1
	end

	def new
   		@word = Word.new
   		@word.choices.build
  	end

  	def create
    	@word = Word.new(word_params)
    	@word.category_id = params[:category_id]
    	
	    if @word.save
	    redirect_to admin_category_words_path(@word.category_id)
	    else
	    render 'new'
	    end
  	end

  	def show
  		@word = Word.find(params[:id])
   		@choices = Choice.where(word_id: @word.id)
  	end

  	def edit
    	@word = Word.find(params[:id])
   		# @word.choices.build
  	end
  
  	def update
    	@word = Word.find(params[:id])

    	if @word.update_attributes(word_params)
	      flash[:notice] = "Success"
	      redirect_to admin_category_words_path(@word.category_id)
	    else
	      render "edit" 
	    end
	 end

	 def destroy
		word = Word.find(params[:id])
		word.destroy
		redirect_to admin_category_words_path(word.category_id)
	end



	private
		def admin_user
			unless current_user.admin?
				flash[:notice] = "You are not admin."
				redirect_to root_url  
			end	
		end

	    def word_params
	     	params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct])
	    end	
end
