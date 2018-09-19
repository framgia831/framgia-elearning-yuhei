class Relationship < ApplicationRecord
	has_many :activity, as: :action
end
