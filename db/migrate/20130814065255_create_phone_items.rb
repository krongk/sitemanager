class CreatePhoneItems < ActiveRecord::Migration
  def change
    create_table :phone_items do |t|
      t.references :user
      t.string :mobile
      t.string :source_name
      t.string :name
      t.string :city
      t.string :area
      t.text :description
      t.text :note
      t.string :is_processed, :default => 'n'
      t.integer :send_count, :default => 0
      t.integer :account_id

      t.timestamps
    end
    add_index :phone_items, :user_id
    add_index :phone_items, [:user_id, :mobile], :unique => true
    add_index :phone_items, :city
    add_index :phone_items, :source_name
  end
end
