class RelationshipsController < ApplicationController
	def create
		relationship = Relationship.create(
			follower_id: current_user.id,
			followed_id: params[:followed_id]
			 )
		relationship.create_activity(user_id: current_user.id)

		redirect_to user_url(params[:followed_id])
	end

	def destroy
		relationship = Relationship.find(params[:id])
		activity = Activity.where(action_id: params[:id]).find_by(action_type: Relationship)
		
		relationship.destroy
		activity.destroy
		redirect_to user_url(relationship.followed_id)
	end
end
