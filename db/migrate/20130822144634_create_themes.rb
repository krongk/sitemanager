class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name, :limit => 64, :null => false
      t.string :tags
      t.integer :share_count, :default => 1

      t.timestamps
    end
    add_index :themes, :name, :unique => true
  end
end
