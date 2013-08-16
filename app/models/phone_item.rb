#encoding: utf-8
class PhoneItem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :account_id, :area, :city, :description, :is_processed, :mobile, :name, :note, :send_count, :source_name

  after_create :increment_total_count
  after_destroy :decrement_total_count

  validates_presence_of :mobile
  validates_presence_of :user_id
  validate do
    (m = !self.mobile.to_s.strip.match(/^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$/)) &&
      errors.add(:base, "格式错误")
  end
  validates_uniqueness_of :mobile, :scope => [:user_id]

  def increment_total_count
    Keystore.increment_value_for("user:#{self.user_id}:phone_items_count")
  end
  def decrement_total_count
    Keystore.decrement_value_for("user:#{self.user_id}:phone_items_count")
  end
end
