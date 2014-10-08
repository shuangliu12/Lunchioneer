require 'rails_helper'

feature "user can search for meals based on location" do
  scenario "user can search for kitchens based on location" do
      user = FactoryGirl.create(:user)
      kitchen = FactoryGirl.create(:kitchen)

      visit root_path
      fill_in("seacrh", with: kitchen.city)
      click_on "search"

      expect(page).to have_content(kitchen.name)
  end
end
