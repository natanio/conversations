class User < ActiveRecord::Base
  after_create :set_username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hangouts
  has_many :posts

  private
    def set_username
       self.username = "user-#{ SecureRandom.hex(10)}"
    end
end
