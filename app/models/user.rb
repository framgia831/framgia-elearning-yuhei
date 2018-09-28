class User < ApplicationRecord
	has_secure_password
	has_many :lessons, dependent: :delete_all
	has_many :categories, through: :lessons
	has_many :answers, through: :lessons
	has_many :words, through: :lessons

	has_many :active_relationships, class_name:  "Relationship",
                             foreign_key: "follower_id",
                             dependent:   :destroy

 	has_many :passive_relationships, class_name:  "Relationship",
                             foreign_key: "followed_id",
                             dependent:   :destroy

 	has_many :following, through: :active_relationships, source: :followed
 	has_many :followers, through: :passive_relationships, source: :follower

	validates :name, presence: true
	
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
					  format: { with: EMAIL_REGEX },
					  uniqueness: true

  	mount_uploader :image, PictureUploader

	def relationship(other_user)
		Relationship.find_by(
			follower_id: id,
			followed_id: other_user.id
			)	  	
	end

	def feed
		Activity.where(user_id: following_ids << id)
	end

	# def myself
	# 	if self.id == current_user.id
	# 		"YOU"
	# 	else	
	# 		self.name
	# 	end	
		
	# end

end
