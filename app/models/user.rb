class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_username

  has_one :profile
  before_create :build_profile

  has_many :hangouts
  has_many :rsvps
  has_many :rsvped_hangouts, through: :rsvps, source: :rsvped, source_type: 'Hangout'
  has_many :posts
  has_attached_file :avatar, :s3_host_name => "s3-us-west-2.amazonaws.com", :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.oldbookillustrations.com/gallery/characters/louis-xiv.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 
  private
    def set_username
      a = ['achlis', 'unicorn', 'bodach', 'camahueto', 'centaur', 'diwata', 'drakon', 'reichsadler', 'rompo', 'likho', 'lynx', 'sphinx', 'squonk' ]
      self.username = "#{a.sample}-#{ SecureRandom.hex(6) }"
    end
end