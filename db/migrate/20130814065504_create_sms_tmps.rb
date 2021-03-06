class CreateSmsTmps < ActiveRecord::Migration
  def change
    create_table :sms_tmps do |t|
      t.references :user, :null => false
      t.string :title, :null => false
      t.text :content, :null => false

      t.timestamps
    end
    add_index :sms_tmps, :user_id
  end
end
