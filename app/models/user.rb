class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_username

  has_many :hangouts
  has_many :posts
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.oldbookillustrations.com/gallery/characters/louis-xiv.jpg"

  private
    def set_username
      a = ['achlis', 'unicorn', 'bodach', 'camahueto', 'centaur', 'diwata', 'drakon', 'reichsadler', 'rompo', 'likho', 'lynx', 'sphinx', 'squonk' ]
      self.username = "#{a.sample}-#{ SecureRandom.hex(6) }"
    end
end