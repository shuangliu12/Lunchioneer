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

  scenario "authorized user can update a meal" do
    meal = FactoryGirl.create(:meal)
    kitchen = FactoryGirl.create(:kitchen, user: meal.user)

    sign_in_as(meal.user)
    visit user_kitchen_path(kitchen.user, kitchen)
    click_on "edit"

    fill_in("Name", with: "Blueberry Pie")
    fill_in("Description", with: "authentic food" )
    fill_in("Price", with: 3)
    fill_in("Portion", with: 3)

    click_on "submit"
    expect(page).to have_content("Blueberry")
  end

  scenario "authorized user get error if use fail to fill out the form" do
    meal = FactoryGirl.create(:meal)
    kitchen = FactoryGirl.create(:kitchen, user: meal.user)

    sign_in_as(meal.user)
    visit user_kitchen_path(kitchen.user, kitchen)
    click_on "edit"

    fill_in("Name", with: "")
    click_on "submit"

    expect(page).to have_content("You need to fill out the required fields.")
  end

  scenario "authorized user can update a meal" do
    meal = FactoryGirl.create(:meal)
    kitchen = FactoryGirl.create(:kitchen, user: meal.user)

    sign_in_as(meal.user)
    visit user_kitchen_path(kitchen.user, kitchen)
    click_on "delete"

    expect(page).to_not have_content(meal.name)
  end
end
