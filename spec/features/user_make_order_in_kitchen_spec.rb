require 'rails_helper'

feature "user can make orders on kitchen page" do
  scenario "user has to log in to see the order button" do
    kitchen = FactoryGirl.create(:kitchen)
    meal = FactoryGirl.create(:meal, user: kitchen.user)

    visit user_kitchen_path(kitchen.user, kitchen)
    expect(page).to have_content("You need to log in to make an order")
  end

  scenario "user can make an order if portions available" do
    user = FactoryGirl.create(:user)
    meal = FactoryGirl.create(:meal)
    kitchen = FactoryGirl.create(:kitchen, user: meal.user)

    sign_in_as(user)
    visit user_kitchen_path(kitchen.user, kitchen)
    click_on "Order"

    expect(page).to have_content(meal.portion-1)
    expect(page).to have_content("You have successfully placed your order.")
  end
end
