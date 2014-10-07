FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@gmail.com}"}
    sequence(:username){|n|"user_name#{n}"}
    sequence(:first_name){|n|"first_name#{n}"}
    password "12345678"
  end
end
