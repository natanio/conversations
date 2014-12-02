class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :rsvped, polymorphic: true
  belongs_to :hangout
end