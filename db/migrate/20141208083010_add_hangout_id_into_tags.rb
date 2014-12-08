class AddHangoutIdIntoTags < ActiveRecord::Migration
  def change
  	add_column :tags, :hangout_id, :integer
  end
end
