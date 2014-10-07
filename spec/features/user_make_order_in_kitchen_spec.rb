require 'rails_helper'

feature "user can make orders on kitchen page" do
  scenario "user can make an order if portions available" do
      user = FactoryGirl.create(:user)
      meal = FactoryGirl.create(:meal)

      visit kitchen_path
      click_on "Order"

      expect(page).to have_content(meal.portion-1)
  end
end
