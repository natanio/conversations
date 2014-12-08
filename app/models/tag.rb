class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :posts, through: :taggings
	belongs_to :hangout

	def self.counts
  		self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("tags.name, taggings.tag_id")
	end

	def self.counts_with_hangout(hangout_id)
		hangout = Hangout.find(hangout_id)
		hangout.tags.select("name, count(taggings.tag_id) as count").joins(:taggings).group("tags.name, taggings.tag_id")
	end
end
