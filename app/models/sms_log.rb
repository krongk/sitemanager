class SmsLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :sms_tmp
  attr_accessible :resource, :resource_id, :status

  after_create :increment_total_count
  after_destroy :decrement_total_count

  def increment_total_count
    Keystore.increment_value_for("user:#{self.user_id}:sms_logs_count")
  end
  def decrement_total_count
    Keystore.decrement_value_for("user:#{self.user_id}:sms_logs_count")
  end

end
