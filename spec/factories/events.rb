# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    latitude 1.5
    longitude 1.5
    airTemp 1.5
    amount 1
    length 1.5
  end
end
