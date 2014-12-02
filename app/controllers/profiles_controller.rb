class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show]

	def show
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:profile_id]) rescue Profile.find(params[:id])
    end
end
