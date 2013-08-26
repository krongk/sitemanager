#encoding: utf-8
class SitePost < ActiveRecord::Base
  belongs_to :user
  belongs_to :site

  attr_accessible :user_id, :site_id, :cate_id, :content, :title

  validates_presence_of :user_id, :site_id, :cate_id, :title, :content

  POST_CATES = ['新闻', '专题', '服务项目', '关于我们', '联系我们']
  def self.cates
  	POST_CATES
  end
  def self.cate_id(name)
  	POST_CATES.index(name)
  end

end
