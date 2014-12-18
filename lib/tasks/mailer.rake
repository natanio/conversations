namespace :mailer do
  desc "New Follower Digest"
  task :deliver_daily_follower_digest => :environment do
    # Find follow records from the last 24 hours
    @follows = Follow.where("created_at > ? AND created_at < ?", (Time.now.midnight - 1.day), Time.now.midnight)

    @follows.each do |follow|
      # We want to find the user who was followed, and email them
      @followed_user = User.find_by_id(follow.followable_id)

      if follow.followable_id == @followed_user.id
        # Find all the users who followed @followed_user
        @followers = User.where(id: follow.follower_id)
      end
      puts "Sending follower digest to #{@followed_user.email}"
      UserMailer.new_followers(@followed_user, @followers).deliver
    end
  end
end

