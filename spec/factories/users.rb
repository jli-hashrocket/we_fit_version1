# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "hellogoodbye#{n}@lovesong.com"
  end

  factory :user do
    first_name "Robert"
    last_name "Smith"
    email
    username "Cure4Ever"
    password "L1pst1cknhairspr@y"
    password_confirmation "L1pst1cknhairspr@y"
    gender "Male"
  end
end
