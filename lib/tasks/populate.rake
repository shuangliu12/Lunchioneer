namespace :db do
  desc "Create 20 users with random names and reviews"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    User.populate(20) do |user|
      user.username = Faker::Name.first_name
      user.first_name = Faker::Name.first_name
      user.encrypted_password = "12345678"
      user.email = Faker::Internet.email
      user.sign_in_count = 3

        Kitchen.populate(1) do |kitchen|
          kitchen.name = Faker::Lorem.word
          kitchen.user_id = user.id
          kitchen.description = Populator.sentences(1..2)
          kitchen.address = Faker::Address.street_address
          kitchen.city = Faker::Address.city
          kitchen.state = Faker::Address.state_abbr
          kitchen.zipcode = Faker::Address.zip_code

             Review.populate(5) do |review|
              review.user_id = user.id
              review.kitchen_id = kitchen.id
              review.body = Populator.sentences(2..10)
              review.created_at = Faker::Date.between(500.days.ago, Date.today)
              review.kitchen_id = 0..20
              review.rating = 1..5
            end

            Meal.populate(2) do |meal|
              meal.user_id = kitchen.user_id
              meal.name = Faker::Lorem.word
              meal.description = Faker::Lorem.sentences(1..2)
              meal.price = 1..20
              meal.portion = 1..5
              meal.meal_date = Faker::Date.between(400.days.ago, Date.today)
          end
        end
      end
  end
end
