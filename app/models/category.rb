class Category < ApplicationRecord
	has_many :words, dependent: :delete_all
	has_many :lessons, dependent: :delete_all
	
	validates :title, presence: true, length: { in: 1..75 } 
	validates :description, presence: true

end
