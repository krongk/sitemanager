# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_blog do
    user nil
    blog_item nil
    blog_url "MyString"
    login_name "MyString"
    login_password "MyString"
    is_processed false
    note "MyString"
  end
end
