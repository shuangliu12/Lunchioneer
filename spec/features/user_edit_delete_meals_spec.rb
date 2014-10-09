require "rails_helper"

feature "authenticated user can edit or delete meal" do
  scenario "unauthenticated user cannot see the edit or delete button" do
    kitchen = FactoryGirl.create(:kitchen)
    meal = FactoryGirl.create(:meal)
    unauthorized_user = FactoryGirl.create(:user)
    authorized_user = meal.user

    sign_in_as(unauthorized_user)
    visit user_kitchen_path(kitchen.user, kitchen)

    expect(page).to_not have_content("edit")
    expect(page).to_not have_content("delete")
  end

  scenario "authorized user can edit or delete a meal" do
    meal = FactoryGirl.create(:meal)
    kitchen = FactoryGirl.create(:kitchen, user: meal.user)

    sign_in_as(meal.user)
    visit user_kitchen_path(kitchen.user, kitchen)
    click_on "delete"
    expect(page).to_not have_content(meal.name)
  end
end
