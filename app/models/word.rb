class Word < ApplicationRecord
	belongs_to :category
	has_many :choices, dependent: :destroy
	has_many :answers, dependent: :destroy

	accepts_nested_attributes_for :choices
	accepts_nested_attributes_for :answers


	validates :content, presence: true, length: { in: 1..75 } 
	validate :one_correct

	def one_correct
		unless choices.map {|a| a.correct}.count(true) == 1
			errors.add(:choices, "should be one answer")
		end

	end

	def correct_answer
		choices.find_by(correct: true).content
	end

end
