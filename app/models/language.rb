class Language < ActiveRecord::Base
	has_many :hangouts, dependent: :destroy
	has_many :users, through: :hangouts
	has_many :posts, through: :hangouts
	has_many :rsvps, through: :hangouts
	acts_as_followable
end
