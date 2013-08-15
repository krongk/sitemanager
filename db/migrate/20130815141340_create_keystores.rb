class CreateKeystores < ActiveRecord::Migration
  def change
    create_table :keystores, :id => false, :force => true do |t|
      t.string :key, :limit => 50, :default => "", :null => false
      t.integer :value, :limit => 20

      t.timestamps
    end
    add_index "keystores", ["key"], :name => "key", :unique => true
  end
end
