#encoding: utf-8
class MailTmp < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :content, :title
end
