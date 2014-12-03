class PagesController < ApplicationController
before_action :check_signed_in, only: [:home]
  def about
  end

  def contact
  end

  def home
  end

private
	def check_signed_in
		unless user_signed_in?
		else
			redirect_to profile_path(current_user)
		end
	end
end
