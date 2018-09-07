class User < ApplicationRecord
	has_secure_password
	validates :name, presence: true
	validates :password, presence: true
	
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
					  format: { with: EMAIL_REGEX },
					  uniqueness: true

end
