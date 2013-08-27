#encoding: utf-8
class BlogItem < ActiveRecord::Base
  attr_accessible :cate_id, :name, :register_url, :url
  has_many :user_blogs

  BLOG_CATES = {1 => '商业博客', 2 => '个人博客', 3 => 'Wordpress', 4 => 'DedeCMS', 5 => 'Drupal'}
  def self.cates
  	BLOG_CATES
  end

  def self.cate_name(id)
  	BLOG_CATES[id]
  end

end
