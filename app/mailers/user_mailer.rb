class UserMailer < ActionMailer::Base
  default from: "hello@fluentli.com"

  def new_live_chat(hangout, user)
  	@user = user
  	@hangout = hangout
  	@start_time = hangout.start_time
  	@end_time = hangout.end_time
  	@language = hangout.language.name
  	mail(to: @user.email, subject: "There's a new #{@language} chat starting")
  end
end