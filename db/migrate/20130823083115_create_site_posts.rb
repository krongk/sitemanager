class CreateSitePosts < ActiveRecord::Migration
  def change
    create_table :site_posts do |t|
      t.references :user
      t.references :site
      t.string :title
      t.text :content
      t.integer :cate_id

      t.timestamps
    end
    add_index :site_posts, :user_id
    add_index :site_posts, :site_id
  end
end
