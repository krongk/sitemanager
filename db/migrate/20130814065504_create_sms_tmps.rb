class CreateSmsTmps < ActiveRecord::Migration
  def change
    create_table :sms_tmps do |t|
      t.references :user
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :sms_tmps, :user_id
  end
end
