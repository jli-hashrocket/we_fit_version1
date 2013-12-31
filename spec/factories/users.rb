# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Robert"
    last_name "Smith"
    username "Cure4Ever"
    email "rsmith@lovesong.com"
    password "L1pst1cknhairspr@y"
    password_confirmation "L1pst1cknhairspr@y"
  end
end
