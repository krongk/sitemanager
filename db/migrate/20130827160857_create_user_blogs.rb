class CreateUserBlogs < ActiveRecord::Migration
  def change
    create_table :user_blogs do |t|
      t.references :user, :null => false
      t.references :blog_item, :null => false
      t.string :blog_url, :null => false
      t.string :login_name, :null => false
      t.string :login_password, :null => false
      t.boolean :is_processed
      t.string :note

      t.timestamps
    end
    add_index :user_blogs, :user_id
    add_index :user_blogs, :blog_item_id
  end
end
