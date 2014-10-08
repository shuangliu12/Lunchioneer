require "rails_helper"

feature "Authenticated user can leave reviews in the kitchen page" do
  scenario "Unathenticated user cannot leave reviews" do
    kitchen = FactoryGirl.create(:kitchen)

    visit user_kitchen_path(kitchen.user, kitchen)

    expect(page).to have_content("Please sign in to leave a review.")
  end

  scenario "Authenticated user can see review box" do
    kitchen = FactoryGirl.create(:kitchen)
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit user_kitchen_path(kitchen.user, kitchen)

    expect(page).to have_button("Create Review")
  end

  scenario "Authenticated user can write a review" do
    kitchen = FactoryGirl.create(:kitchen)
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)
    sign_in_as(user)
    visit user_kitchen_path(kitchen.user, kitchen)
    fill_in("Your Review", with: review.body)
    select 4, from: "Rating"
    click_on "Create Review"

    expect(page).to have_content("You have successfully created your review.")
    expect(page).to have_content(review.body)
  end
end
