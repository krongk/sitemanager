#encoding: utf-8
class SitePost < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  attr_accessible :user_id, :site_id, :cate_id, :content, :title

  validates_presence_of :user_id, :site_id, :cate_id, :title, :content

  def self.cates
  	['新闻页', '主题页', '服务项目']
  end
  def self.cate_id(name)
  	['新闻页', '主题页', '服务项目'].index(name)
  end

end
