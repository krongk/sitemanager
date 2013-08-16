class CreateMailItems < ActiveRecord::Migration
  def change
    create_table :mail_items do |t|
      t.references :user, :null => false
      t.string :email, :limit => 32, :null => false
      t.string :name, :limit => 64
      t.string :source_name, :limit => 128
      t.string :city, :limit => 64
      t.string :area
      t.text :description
      t.text :note
      t.string :is_processed, :default => 'n'
      t.integer :send_count, :default => 0
      t.integer :customer_id

      t.timestamps
    end
    add_index :mail_items, :user_id
    add_index :mail_items, [:user_id, :email], :unique => true
    add_index :mail_items, :city
    add_index :mail_items, :source_name
  end
end
