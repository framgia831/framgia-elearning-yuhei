class Admin::CategoriesController < ApplicationController

	def index
		@categories = Category.all
		@i = 1
	end

	def new
   		@category = Category.new
  	end

  	def create
    	@category = Category.new(category_params)
	    if @category.save
	    redirect_to admin_categories_path
	    else
	      render 'categorys/new'
	    end
  	end

  	def edit
    	@category = Category.find(params[:id])
  	end
  
  	def update
    	@category = Category.find(params[:id])

    	if @category.update_attributes(category_params)
	      flash[:notice] = "Success"
	      redirect_to admin_categories_path
	    else
	      render "categorys/edit" 
	    end
	 end

	 def destroy
		category = Category.find(params[:id])
		category.destroy

		redirect_to admin_categories_path
	end



	private
		def admin_user
			redirect_to(root_url) unless current_user.Admin?
		end

	    def category_params
	      params.require(:category).permit(:title, :description)
	    end	
end