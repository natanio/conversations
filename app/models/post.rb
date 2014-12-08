class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :hangout
	has_many :taggings
	has_many :tags, through: :taggings

	after_save :update_tags

	def all_tags=(names)
  		self.tags = names.split(",").map do |name|
      	Tag.where(name: name.strip).first_or_create!
  		end
	end
 
	def all_tags
  		self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
  		Tag.find_by_name!(name).posts
	end

	protected

	def update_tags
		self.tags.each do |tag|
			tag.update_column('hangout_id', self.hangout_id)
		end
	end
end
