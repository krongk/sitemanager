#encoding: utf-8
class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :theme
  has_many :site_posts
  has_many :site_comments

  attr_accessible :user_id, :body, :domain, :footer, :head, :header, :site_name, :site_title, :theme_id, :is_published

  validates_presence_of :site_name
  validates_presence_of :user_id
  validate do
    (m = !self.site_name.to_s.strip.match(/^[0-9a-z.]+$/)) &&
      errors.add(:base, "网站名称格式错误, 只能包含数字和字母的组合")
  end
  validates_uniqueness_of :site_name, :case_sensitive => false
  
  #
  after_create :increment_total_count
  after_destroy :decrement_total_count

  def increment_total_count
    Keystore.increment_value_for("user:#{self.user_id}:sites_count")
  end
  def decrement_total_count
    Keystore.decrement_value_for("user:#{self.user_id}:sites_count")
  end

end
