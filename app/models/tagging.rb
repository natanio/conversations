class Tagging < ActiveRecord::Base
  belongs_to :hangout	
  belongs_to :post
  belongs_to :tag
end
