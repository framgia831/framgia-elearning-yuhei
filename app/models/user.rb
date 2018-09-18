class User < ApplicationRecord
	has_secure_password
	has_many :lessons, dependent: :delete_all
	# has_many :categories, throuth: :lessons

	
	validates :name, presence: true
	validates :password, presence: true

	
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

end
