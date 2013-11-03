# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :peg do
    user_id nil
    fp_id 1
    code "MyString"
    person "MyString"
    place "MyString"
    action "MyString"
    link "MyString"
    note "MyString"
  end
end
