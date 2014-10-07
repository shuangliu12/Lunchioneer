FactoryGirl.define do
  factory :kitchen do
    name "Italian Kitchen"
    description "All kinds of food"
    address "55 Farwell St"
    city "Newtonville"
    state "MA"
    zipcode "02460"

    association :user
  end
end
