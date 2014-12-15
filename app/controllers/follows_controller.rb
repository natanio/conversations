class FollowsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user

	def create
		current_user.follow(@user)
		render :create, locals: { user: @user }
	end

	def destroy
		current_user.stop_following(@user)
		render :create, { user: @user }
	end

	private

	def set_user
		@user = User.find(params[:id])
	end
end