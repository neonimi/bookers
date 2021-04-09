class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	def create
		follow = current_user.active_relationships.build(followed_id: params[:user_id])
		follow.save
		# 	redirect_to root_path, notice: "フォローしました"
		# else
		# 	redirect_to root_path, alart: "フォローできません"
		# end
	end

	def destroy
		follow = current_user.active_relationships.find_by!(followed_id: params[:user_id])
		follow.destroy
		# 	redirect_to root_path, notice: "フォロー解除しました"
		# end
	end
end
