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
    all(:xpath, '//a[text()="edit"]')[1].click

    fill_in("Name", with: "Blueberry Pie")
    fill_in("Description", with: "authentic food" )
    fill_in("Price", with: 3)
    fill_in("Portion", with: 3)
    select '2011', from: "meal_meal_date_1i"
    select 'October', from: "meal_meal_date_2i"
    select '15', from: "meal_meal_date_3i"

    click_on "Update Meal"
    expect(page).to have_content("Blueberry")
  end

  scenario "authorized user get error if use fail to fill out the form" do
    meal = FactoryGirl.create(:meal)
    kitchen = FactoryGirl.create(:kitchen, user: meal.user)

    sign_in_as(meal.user)
    visit user_kitchen_path(kitchen.user, kitchen)
    all(:xpath, '//a[text()="edit"]')[1].click

    fill_in("Name", with: "")
    click_on "Update Meal"

    expect(page).to have_content("You need to fill out the required fields.")
  end

  scenario "authorized user can update a meal" do
    meal = FactoryGirl.create(:meal)
    kitchen = FactoryGirl.create(:kitchen, user: meal.user)

    sign_in_as(meal.user)
    visit user_kitchen_path(kitchen.user, kitchen)
    all(:xpath, '//a[text()="delete"]')[1].click

    expect(page).to_not have_content(meal.name)
  end
end
