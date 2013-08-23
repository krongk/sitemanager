# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_post do
    user nil
    site nil
    title "MyString"
    content "MyText"
    cate_id 1
  end
end
