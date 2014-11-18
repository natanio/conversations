class Language < ActiveRecord::Base
	has_many :hangouts
	has_many :users, through: :hangouts
	has_many :posts, through: :hangouts
end
