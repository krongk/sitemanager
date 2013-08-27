class CreateBlogItems < ActiveRecord::Migration
  def change
    create_table :blog_items do |t|
      t.integer :cate_id, :null => false
      t.string :name, :null => false
      t.string :url
      t.string :register_url

      t.timestamps
    end
  end
end
