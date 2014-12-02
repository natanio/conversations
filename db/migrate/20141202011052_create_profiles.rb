class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
