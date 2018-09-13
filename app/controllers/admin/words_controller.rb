class Admin::WordsController < ApplicationController
	before_action :admin_user

	def index
		@category = Category.find(params[:category_id])
		@words = @category.words
	end

	def new
		@category = Category.find(params[:category_id])
   		@word = Word.new
   		3.times {@word.choices.build}
  	end

  	def create
    	category = Category.find(params[:category_id])
		@word = category.words.build(word_params)

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
