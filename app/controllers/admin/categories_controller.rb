class Admin::CategoriesController < ApplicationController
	before_action :admin_user

	def index
		@categories = Category.all
    	@categories_page = Category.page(params[:page]).per(5)
		
	end

	def new
   		@category = Category.new
  	end

  	def create
    	@category = Category.new(category_params)
	    if @category.save
	    redirect_to admin_categories_path
	    else
	      render 'new'
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
	      render "edit" 
	    end
	 end

	 def destroy
		category = Category.find(params[:id])
		category.destroy

		redirect_to admin_categories_path
	end



	private
		def admin_user
			unless current_user.admin?
				flash[:notice] = "You are not admin."
				redirect_to(root_url) 
			end	
		end

	    def category_params
	     	params.require(:category).permit(:title, :description)
	    end	

	  
end