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

  scenario "authorized user can edit or delete a review" do
    review = FactoryGirl.create(:review)

    sign_in_as(review.user)
    visit kitchen_path(review.kitchen)

    click_on "delete"
    expect(page).to_not have_content(review.body)
  end
end
