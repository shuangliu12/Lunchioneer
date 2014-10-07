FactoryGirl.define do
  factory :meal do
    name "Turkey Pie"
    description "delicious pie with soup"
    price 3
    portion 2

    association :user
  end
end
