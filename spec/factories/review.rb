FactoryGirl.define do
  factory :review do
    body "Great cook and great food"
    rating 5

    association :user
    association :kitchen
  end
end
