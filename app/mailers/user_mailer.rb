class UserMailer < ActionMailer::Base
  default from: "\"Fluentli\" hello@fluentli.com"

  def new_live_chat(hangout, user)
  	@user = user
  	@hangout = hangout
  	@start_time = hangout.start_time
  	@end_time = hangout.end_time
  	@language = hangout.language.name
    @title = hangout.name
    @owner = hangout.user
  	mail(to: @user.email, subject: "There's a new #{@language} chat starting")
  end

  def new_scheduled_chat(hangout, user)
  	@user = user
  	@hangout = hangout
  	@start_time = hangout.start_time
  	@end_time = hangout.end_time
  	@language = hangout.language.name
    @title = hangout.name
    @owner = hangout.user
  	mail(to: @user.email, subject: "Can you join this #{@language} chat?")
  end

  def new_followers(user, followers)
    @user = user
    @followers = followers
    mail(to: @user.email, subject: "You got #{@followers.count} new followers today!")
  end
end