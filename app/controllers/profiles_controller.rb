class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show]
    before_action :set_rsvps, only: [:show]
	before_action :set_user, only: [:show]
    before_action :authenticate_user!

	def show
		@user_rsvps = Rsvp.where(user_id: @user.id)
        @followers = @user.followers_by_type('User')
        @following = @user.following_user

        @following_hangouts = Hangout.where(user_id: @following)

        if current_user == @user
            @user_hangouts = Hangout.where(user_id: @user.id).order("start_time DESC")
        else
            @user_hangouts = Hangout.where(["user_id= ? and private = ?", @user.id, false])
        end
        
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
    	@user = @profile.user
    end

    def set_profile
      @profile = Profile.find(params[:profile_id]) rescue Profile.find(params[:id])
    end

    def set_rsvps
        @rsvps = Rsvp.where(user_id: @profile.user)
    end
end
