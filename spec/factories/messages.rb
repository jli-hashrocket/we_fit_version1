# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    sender_id 1
    recipient_id 1
    sender_deleted false
    recipient_deleted false
    subject "MyString"
    body "MyText"
    read_at "2014-02-09 17:38:53"
    container "MyString"
  end
end
