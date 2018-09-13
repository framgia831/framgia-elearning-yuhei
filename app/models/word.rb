class Word < ApplicationRecord
	belongs_to :category
	has_many :choices, dependent: :delete_all
	accepts_nested_attributes_for :choices
	


	validates :content, presence: true, length: { in: 1..75 } 
	validates :category_id, presence: true

end
