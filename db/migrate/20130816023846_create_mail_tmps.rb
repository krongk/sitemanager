class CreateMailTmps < ActiveRecord::Migration
  def change
    create_table :mail_tmps do |t|
      t.references :user, :null => false
      t.string :title, :null => false
      t.text :content, :null => false

      t.timestamps
    end
    add_index :mail_tmps, :user_id
  end
end
