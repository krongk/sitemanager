class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.references :user, :null => false
      t.string :contact_name, :limit => 32, :null => false
      t.string :id_card
      t.string :mobile_phone, :limit => 16, :null => false
      t.string :tel_phone
      t.string :qq, :limit => 16, :null => false
      t.string :email, :limit => 32, :null => false
      t.string :website
      t.string :region
      t.string :city
      t.string :district
      t.string :address
      t.string :latitude
      t.string :longitude
      t.string :company_name
      t.string :company_nickname
      t.string :corporator
      t.string :company_reg_no
      t.string :company_reg_code
      t.text   :company_description
      t.string :company_keywords
      t.string :fu_gmail_name, :limit => 32, :null => false
      t.string :fu_gmail_pwd, :limit => 32, :null => false
      t.string :fu_qmail_name, :limit => 32, :null => false
      t.string :fu_qmail_pwd, :limit => 32, :null => false
      t.string :fu_user_name, :limit => 32, :null => false
      t.string :fu_user_pwd, :limit => 32, :null => false

      t.timestamps
    end
    add_index :user_details, :user_id
    add_index :user_details, :mobile_phone
  end
end
