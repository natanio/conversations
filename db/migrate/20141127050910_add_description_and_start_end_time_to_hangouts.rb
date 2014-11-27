class AddDescriptionAndStartEndTimeToHangouts < ActiveRecord::Migration
  def change
    add_column :hangouts, :description, :text
    add_column :hangouts, :start_time, :datetime
    add_column :hangouts, :end_time, :datetime
  end
end
