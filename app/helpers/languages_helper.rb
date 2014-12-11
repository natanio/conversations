module LanguagesHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def scheduled_hangout_count(language)
  	Hangout.where(["language_id = ? and start_time > ?", language.id, Time.now]).count
  end

  def live_hangout_count(language)
  	Hangout.where(["language_id = ? and start_time <= ? and end_time > ?", language.id, Time.now, Time.now]).count
  end
end