namespace :usermailer do
  desc "New Follower Digest"
  task :deliver_daily_follower_digest => :environment do
    users = User.all

    users.each do |user|
      @follows = Follow.where("created_at > ? AND created_at < ? AND followable_id = ?", (Time.now.midnight - 1.day), Time.now.midnight, user.id)
      
      new_followers = []
      
      @follows.each do |follow|
        new_followers.push(User.find(follow.follower_id))
      end
      
      UserMailer.new_followers(user, new_followers).deliver
    end
  end
end