class UsersController < DeviseController
  before_create :set_username

  private
    def set_username
      o = [1..9].map { |i| i.to_a }.flatten
      self.username = (0...10).map { o[rand(o.length)] }.join
    end
end