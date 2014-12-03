class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :rsvped, polymorphic: true
end