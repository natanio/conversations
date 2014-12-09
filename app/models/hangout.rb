class Hangout < ActiveRecord::Base
	include Filterable

	# Validations
  	#
	validates :name, :description, :user_id, :language_id, :start_time, :end_time, :presence => true
	validates :name, :length => { :maximum => 140, :minimum => 2 }

	scope :active, -> { where('end_time > ?', Time.now)}
	scope :archived, -> { where('end_time <= ?', Time.now)}
	scope :live, -> { where('start_time <= ? and end_time > ?', Time.now, Time.now)}

	belongs_to :language
	belongs_to :user
	has_many :posts, dependent: :destroy
	has_many :users, through: :posts
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :tags, dependent: :destroy
	has_many :rsvps, foreign_key: "rsvped_id", dependent: :destroy

end
