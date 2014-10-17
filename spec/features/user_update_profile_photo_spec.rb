require 'rails_helper'
feature "user can update own profile picture" do
  scenario "user can update own profile picture" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit edit_user_path(user)
    attach_file "Profile photo", Rails.root.join('spec/fixtures/img.jpg')
    click_on 'Update'
    expect(page).to have_content("You have successfully updated")
  end
end
