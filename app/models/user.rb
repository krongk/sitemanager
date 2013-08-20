#encoding: utf-8
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_one  :user_detail
  has_many :sms_tmps, :dependent => :destroy
  has_many :sms_logs, :dependent => :destroy
  has_many :phone_items, :dependent => :destroy
  has_many :mail_items, :dependent => :destroy
  has_many :mail_tmps, :dependent => :destroy
  has_many :sites, :dependent => :destroy

  before_create :set_default_roles
  after_create :create_user_detail

  private
  def set_default_roles
    self.roles = [Role.find_or_create_by_name('user')]
  end

  def create_user_detail
    self.user_detail.create!(:user_id => self.id, :contact_name => self.name, :email => self.email)
  end

end
