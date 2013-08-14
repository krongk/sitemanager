# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone_item do
    user nil
    mobile "MyString"
    source_name "MyString"
    name "MyString"
    city "MyString"
    area "MyString"
    description "MyText"
    note "MyText"
    is_processed "MyString"
    send_count 1
    account_id 1
  end
end
