class Relationship < ApplicationRecord
	has_one :activity, as: :action, dependent: :destroy
 	belongs_to :follower, class_name: "User"
  	belongs_to :followed, class_name: "User"
end
