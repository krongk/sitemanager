# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mail_item do
    user nil
    email "MyString"
    name "MyString"
    source_name "MyString"
    city "MyString"
    area "MyString"
    description "MyText"
    note "MyText"
    is_processed "MyString"
    send_count 1
    customer_id 1
  end
end
