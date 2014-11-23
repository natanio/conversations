class AddHangoutToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :hangout_id, :integer
    add_index :taggings, :hangout_id
  end
end
