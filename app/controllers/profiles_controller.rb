class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show]
    before_action :set_rsvp, only: [:show]
	before_action :set_user, only: [:show]

	def show
		@user_rsvps = Rsvp.where(user_id: @user.id)
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
    	@user = User.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id]) rescue Profile.find(params[:id])
    end

    def set_rsvp
        @rsvp = Rsvp.where(user_id: @profile.user)
    end
end
