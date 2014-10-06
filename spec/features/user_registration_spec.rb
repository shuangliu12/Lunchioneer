require 'rails_helper'

feature "user signs up" do
  scenario "user fill out required fields to sign up" do
      user = FactoryGirl.build(:user)
      visit root_path
      click_on "Sign up"
      fill_in('Email', with: user.email)
      fill_in('Username', with: user.username)
      fill_in('Password', with: user.password)
      fill_in('Password confirmation', with: user.password)
      click_button("Sign up")

      expect(page).to have_content("You have signed up successfully.")
  end
end
