class FollowsController < ApplicationController
	before_action :set_profile
	def create
		current_user.follow(@profile.user)
		redirect_to :back
		flash[:notice] = "You are now following #{@profile.user.username}."
	end

	def destroy
		current_user.stop_following(@profile.user)
		redirect_to profile_path(current_user.profile)
		flash[:alert] = "You stopped following #{@profile.user.username}."
	end

	private

	def set_profile
		@profile = Profile.find(params[:id]) rescue Profile.find(params[:id])
	end
end