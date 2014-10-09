require 'rails_helper'

feature "user can search for meals based on location" do
  scenario "user can search for kitchens based on location" do
      user = FactoryGirl.create(:user)
      kitchen = FactoryGirl.create(:kitchen)

      visit root_path
      fill_in("Search", with: kitchen.city)
      click "Search"

      expect(page).to have_content(kitchen.name)
  end
end
