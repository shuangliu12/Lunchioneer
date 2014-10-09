require 'rails_helper'

feature "user can search for meals based on location" do
  scenario "user can search for kitchens based on location", focus: true do
    kitchen = FactoryGirl.create(:kitchen)

    visit root_path
    fill_in("search", with: kitchen.city)
    click_on "Search"

    expect(page).to have_content(kitchen.name)
  end
end
