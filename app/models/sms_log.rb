class SmsLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :sms_tmp
  attr_accessible :resource, :resource_id, :status
end
