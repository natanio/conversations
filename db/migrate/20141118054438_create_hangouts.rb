class CreateHangouts < ActiveRecord::Migration
  def change
    create_table :hangouts do |t|
      t.string :name
      t.integer :language_id
      t.boolean :private

      t.timestamps
    end
    add_index :hangouts, :language_id
  end
end
