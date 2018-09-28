class Category < ApplicationRecord
	has_many :words, dependent: :destroy
	has_many :lessons, dependent: :destroy
	has_many :answers, through: :lessons
	
	validates :title, presence: true, length: { in: 1..75 } 
	validates :description, presence: true

end
