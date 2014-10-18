FactoryGirl.define do
  factory :meal do
    name "Turkey Pie"
    description "delicious pie with soup"
    price 3
    portion 2
    meal_date "3rd Feb 2018"

    association :user
  end
end
