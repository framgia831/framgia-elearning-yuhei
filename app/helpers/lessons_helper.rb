module LessonsHelper
	def category_choices
		current_user.categories.map{ |category| [category.title, category.id] }
	end
end
