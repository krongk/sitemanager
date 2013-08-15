# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource_item do
    resource_type 1
    resource_name "MyString"
    resource_path "MyString"
  end
end
