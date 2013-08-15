class PhoneItem < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :account_id, :area, :city, :description, :is_processed, :mobile, :name, :note, :send_count, :source_name
end
