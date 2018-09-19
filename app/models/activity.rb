class Activity < ApplicationRecord
  # belongs_to :action
  belongs_to :action, polymorphic: true
end
