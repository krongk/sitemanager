#encoding: utf-8
class MailItem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :area, :city, :account_id, :description, :email, :is_processed, :name, :note, :send_count, :source_name

  after_create :increment_total_count
  after_destroy :decrement_total_count

  validates_presence_of :email
  validates_presence_of :user_id
  validate do
    (m = !self.email.to_s.strip.match(/^[\w-]+@([\w-]+\.)+[\w]+$/)) &&
      errors.add(:base, "邮件地址格式错误")
  end
  validates_uniqueness_of :email, :scope => [:user_id]

  def increment_total_count
    Keystore.increment_value_for("user:#{self.user_id}:mail_items_count")
  end
  def decrement_total_count
    Keystore.decrement_value_for("user:#{self.user_id}:mail_items_count")
  end

end
