class Hangout < ActiveRecord::Base
	include Filterable

	after_create :send_notifications

	# Validations
  	#
	validates :name, :description, :user_id, :language_id, :start_time, :end_time, :presence => true
	validates :name, :length => { :maximum => 140, :minimum => 2 }

	scope :active, -> { where('end_time > ?', Time.now)}
	scope :archived, -> { where('end_time <= ?', Time.now)}
	scope :live, -> { where('start_time <= ? and end_time > ?', Time.now, Time.now)}
	scope :joined, -> { where("id = ?", Post.find_by_user_id(1).hangout_id) }
	scope :scheduled, -> { where("start_time > ?", Time.now) }

	belongs_to :language
	belongs_to :user
	has_many :posts, dependent: :destroy
	has_many :users, through: :posts
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :tags, dependent: :destroy
	has_many :rsvps, foreign_key: "rsvped_id", dependent: :destroy

	def new_live_chat_mailer
    followers = self.language.user_followers

	    if !followers.empty?
	      followers.each do |follower|
	      	unless follower == self.user_id
	        	UserMailer.new_live_chat(self, follower)
	        end
	      end
	    end
  	end

  	def new_scheduled_chat_mailer
  		user = User.where(id: self.user_id)
    	followers = self.language.user_followers
    	user_followers = user.user_followers


	    if !followers.empty?
	      followers.each do |follower|
	      	unless follower == self.user_id
	        	UserMailer.new_scheduled_chat(self, follower)
	        end
	      end
	    end
  	end

	private

	def send_notifications
		if self.start_time <= Time.now
    		self.new_live_chat_mailer
    	else
    		self.new_scheduled_chat_mailer
    	end
  	end

end
