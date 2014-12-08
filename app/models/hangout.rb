class Hangout < ActiveRecord::Base
	include Filterable

	scope :active, -> { where('end_time > ?', Time.now)}
	scope :archived, -> { where('end_time <= ?', Time.now)}

	belongs_to :language
	belongs_to :user
	has_many :posts, dependent: :destroy
	has_many :users, through: :posts
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :rsvps, dependent: :destroy
	has_many :tags, dependent: :destroy
end
