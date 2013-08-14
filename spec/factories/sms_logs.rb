# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sms_log do
    user nil
    sms_tmp nil
    resource "MyString"
    resource_id 1
    status 1
  end
end
