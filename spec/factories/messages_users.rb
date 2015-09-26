# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :messages_user, :class => 'MessagesUsers' do
    message_id 1
    user_id 1
    visualized false
  end
end
