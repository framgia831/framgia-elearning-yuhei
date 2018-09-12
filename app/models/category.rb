class Category < ApplicationRecord
	validates :title, presence: true, length: { in: 1..75 } 
	validates :description, presence: true

end
