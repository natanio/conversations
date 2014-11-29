class UsersController < DeviseController
  after_create :set_username

  private
    def set_username
       current_user.username = "user-#{ SecureRandom.hex(10)}"
       current_user.save
    end
end