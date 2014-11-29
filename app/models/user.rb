class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_username

  has_many :hangouts
  has_many :posts

  private
    def set_username
      a = ['achlis', 'unicorn', 'bodach', 'camahueto', 'centaur', 'diwata', 'drakon', 'reichsadler', 'rompo', 'likho', 'lynx', 'sphinx', 'squonk' ]
      self.username = "#{a.sample}-#{ SecureRandom.hex(6) }"
    end
end