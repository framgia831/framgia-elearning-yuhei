class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :delete_all
  has_many :words, through: :answers 
  has_many :choices, through: :answers 

end
	