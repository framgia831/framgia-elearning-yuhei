module CategoriesHelper
	def active_status(learned_status, item_status)
		"active" if learned_status == item_status.to_s
	end
end
