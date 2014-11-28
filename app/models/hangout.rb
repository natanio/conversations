class Hangout < ActiveRecord::Base
	belongs_to :language
	belongs_to :user
	has_many :posts, dependent: :destroy
	has_many :users, through: :posts
	has_many :taggings
	has_many :tags, through: :taggings
end
