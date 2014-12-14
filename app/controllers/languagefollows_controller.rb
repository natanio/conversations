class LanguagefollowsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_language

	def create
		current_user.follow(@language)
		render :create
		flash[:notice] = "You are now following #{@language.name}."
	end

	def destroy
		current_user.stop_following(@language)
		render :create
		flash[:alert] = "You stopped following #{@language.name}."
	end

	private

	def set_language
		@language = Language.find(params[:id])
	end
end