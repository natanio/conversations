class AddUserIdToHangouts < ActiveRecord::Migration
  def change
    add_column :hangouts, :user_id, :integer
  end
end
