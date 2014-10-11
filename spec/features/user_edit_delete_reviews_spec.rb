require "rails_helper"

feature "authenticated user can edit or delete reviews" do
  scenario "unauthenticated user cannot see the edit or delete button" do
    review = FactoryGirl.create(:review)
    unauthorized_user = FactoryGirl.create(:user)
    authorized_user = review.user

    sign_in_as(unauthorized_user)
    visit kitchen_path(review.kitchen)

    expect(page).to_not have_content("edit")
    expect(page).to_not have_content("delete")
  end

  scenario "authorized user can update a review" do
    review = FactoryGirl.create(:review)

    sign_in_as(review.user)
    visit kitchen_path(review.kitchen)
    click_on 'edit'

    fill_in("Your Review", with: "good food")
    click_on "Update Review"

    expect(page).to have_content("good food")
  end

  scenario "authorized user can delete a review" do
    review = FactoryGirl.create(:review)

    sign_in_as(review.user)
    visit kitchen_path(review.kitchen)

    click_on "delete"
    expect(page).to_not have_content(review.body)
  end


  scenario "authorized user get an eror if use fails to fill out the review body" do
    review = FactoryGirl.create(:review)

    sign_in_as(review.user)
    visit kitchen_path(review.kitchen)

    select 4, from: "Rating"
    click_on "Create Review"

    expect(page).to have_content("Please fill out the review form correctly.")
  end
end
