require 'rails_helper'

feature 'admin can delete kitchen' do

  let(:admin) { FactoryGirl.create(:user, admin: true) }

  scenario 'admin can delete kitchens' do
    kitchen = FactoryGirl.create(:kitchen)

    sign_in_as(admin)

    visit admin_kitchens_path

    click_on "delete"
    expect(page).to_not have_content(kitchen.name)
  end
end
