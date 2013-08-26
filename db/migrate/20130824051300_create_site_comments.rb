class CreateSiteComments < ActiveRecord::Migration
  def change
    create_table :site_comments do |t|
      t.references :site
      t.string :name
      t.string :mobile_phone, :limit => 32, :null => false
      t.string :email, :limit => 32
      t.text :content
      t.string :is_processed

      t.timestamps
    end
    add_index :site_comments, :site_id
    add_index :site_comments, :mobile_phone
  end
end
