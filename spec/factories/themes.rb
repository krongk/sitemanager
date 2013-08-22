# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :theme do
    name "MyString"
    tags "MyString"
    share_count 1
  end
end
