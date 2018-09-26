class User < ApplicationRecord
	has_secure_password
	has_many :lessons, dependent: :delete_all
	has_many :categories, through: :lessons
	has_many :answers, through: :lessons
	has_many :words, through: :lessons

	has_many :relationships, class_name:  "Relationship",
                             foreign_key: "follower_id",
                             dependent:   :destroy




	
	validates :name, presence: true

	
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
					  format: { with: EMAIL_REGEX },
					  uniqueness: true

  	mount_uploader :image, PictureUploader

  	def followers
		Relationship.where(followed_id: id)
	end

	def following
		Relationship.where(follower_id: id)
	end

	def relationship(other_user)
		Relationship.find_by(
			follower_id: id,
			followed_id: other_user.id
			)	  	
	end

	def feed
		ids = following.pluck(:followed_id)
		ids << id

		Activity.where(user_id: ids)
	end

	# def myself
	# 	if self.id == current_user.id
	# 		"YOU"
	# 	else	
	# 		self.name
	# 	end	
		
	# end

end
