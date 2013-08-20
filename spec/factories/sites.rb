# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site do
    user nil
    site_name "MyString"
    domain "MyString"
    theme_id 1
    head "MyText"
    header "MyText"
    body "MyText"
    footer "MyText"
  end
end
