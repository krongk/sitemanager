class UserDetail < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :address, :city, :company_description, :company_keywords, :company_name, :company_nickname, :company_reg_code, :company_reg_no, :contact_name, :corporator, :district, :email, :fu_gmail_name, :fu_gmail_pwd, :fu_qmail_name, :fu_qmail_pwd, :fu_user_name, :fu_user_pwd, :id_card, :latitude, :longitude, :mobile_phone, :qq, :region, :tel_phone, :website

end
