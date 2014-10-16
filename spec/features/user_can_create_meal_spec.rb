require "rails_helper"

feature "authenticated user can create a meal" do
  scenario "authenticated user can create a meal" do
    kitchen = FactoryGirl.create(:kitchen)
    meal = FactoryGirl.create(:meal, user: kitchen.user)

    sign_in_as(kitchen.user)
    visit new_meal_path(meal)

    fill_in("Name", with: meal.name)
    fill_in("Description", with: "authentic food" )
    fill_in("Price", with: meal.price)
    fill_in("Portion", with: meal.portion)
    select '2011', from: "meal_meal_date_1i"
    select 'October', from: "meal_meal_date_2i"
    select '15', from: "meal_meal_date_3i"

    click_on "Create Meal"
    expect(page).to have_content("You have succesfully created a meal.")
  end

  scenario "authenticated user get an error if use fails to fill out the form" do
    kitchen = FactoryGirl.create(:kitchen)
    meal = FactoryGirl.create(:meal, user: kitchen.user)

    sign_in_as(kitchen.user)
    visit new_meal_path(meal)

    fill_in("Name", with: meal.name)
    fill_in("Price", with: meal.price)
    fill_in("Portion", with: "")

    click_on "Create Meal"
    expect(page).to have_content("blank")
  end
end
