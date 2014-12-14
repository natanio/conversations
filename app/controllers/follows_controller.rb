class FollowsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile

	def create
		current_user.follow(@profile.user)
		render :create
	end

	def destroy
		current_user.stop_following(@profile.user)
		render :create
	end

	private

	def set_profile
		@profile = Profile.find(params[:id])
	end
end