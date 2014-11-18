class Hangout < ActiveRecord::Base
	belongs_to :language
	has_many :posts
	has_many :users, through: :posts
end
