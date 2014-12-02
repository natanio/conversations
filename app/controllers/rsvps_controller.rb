class RsvpsController < ApplicationController
	before_action :set_hangout

	def create
		Rsvp.create(rsvped: @hangout, user: current_user)
		render :create
	end

	def destroy
		Rsvp.where(rsvped_id: @hangout.id, user_id: current_user.id).first.destroy
		render :create
	end

	private

	def set_hangout
    	@hangout = Hangout.find(params[:hangout_id]) rescue Hangout.find(params[:id])
  	end
end