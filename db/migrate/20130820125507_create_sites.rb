class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :user
      t.string :site_name, :limit => 32, :null => false
      t.string :site_title, :limit => 128, :null => false
      t.string :domain
      t.integer :theme_id
      t.text :head
      t.text :header
      t.text :body
      t.text :footer
      t.boolean :is_published, :default => false

      t.timestamps
    end
    add_index :sites, :user_id
    add_index :sites, :site_name, :unique => true
  end
end
