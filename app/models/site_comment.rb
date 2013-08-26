#encoding: utf-8
class SiteComment < ActiveRecord::Base
  belongs_to :site
  attr_accessible :site_id, :content, :email, :is_processed, :mobile_phone, :name

  validates_presence_of :mobile_phone
  validate do
    (m = !self.mobile_phone.to_s.strip.match(/^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$/)) &&
      errors.add(:base, "手机号格式错误, 请填写正确的手机号，如：15928661802")
  end

end
