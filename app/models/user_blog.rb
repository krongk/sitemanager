class UserBlog < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog_item
  attr_accessible :user_id, :blog_item_id, :blog_url, :is_processed, :login_name, :login_password, :note
end
