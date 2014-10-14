require "rails_helper"

feature "authenticated user can create a meal" do
  scenario "authenticated user can create a meal", focus: true do
    user = FactoryGirl.create(:user)
    kitchen = FactoryGirl.create(:kitchen, user: user)
    meal = FactoryGirl.create(:meal, user: user)

    sign_in_as(user)
    visit new_meal_path(meal)

    fill_in("Name", with: meal.name)
    fill_in("Description", with: "authentic food" )
    fill_in("Price", with: meal.price)
    fill_in("Portion", with: meal.portion)
    select_date(DateTime.now, from: "Select Date")

    save_and_open_page
    click_on "Create Meal"
    expect(page).to have_content("You have succesfully created a meal.")
  end

  scenario "authenticated user get an error if use fails to fill out the form" do
    user = FactoryGirl.create(:user)
    kitchen = FactoryGirl.create(:kitchen, user: user)
    meal = FactoryGirl.create(:meal, user: user)

    sign_in_as(user)
    visit new_meal_path(meal)

    fill_in("Name", with: meal.name)
    fill_in("Price", with: meal.price)
    fill_in("Portion", with: "")

    click_on "submit"
    expect(page).to have_content("blank")
  end
end
