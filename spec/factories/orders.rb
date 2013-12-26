# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    name "MyName"
    address "MyAddress"
    email "MyEmail@example.org"
    pay_type "MyMoney"
  end
end
