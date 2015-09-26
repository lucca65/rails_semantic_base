# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :audit do
    user_id 1
    action "MyString"
    ip "MyString"
    admin_user nil
  end
end
