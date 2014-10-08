require "rails_helper"

feature "authenticated user can create a kitchen" do
  scenario "unauthenticated user cannot see the edit or delete button" do
    kitchen = FactoryGirl.create(:kitchen)
    unauthorized_user = FactoryGirl.create(:user)
    authorized_user = kitchen.user

    sign_in_as(unauthorized_user)
    visit user_kitchen_path(kitchen.user, kitchen)

    expect(page).to_not have_content("edit")
    expect(page).to_not have_content("delete")
  end

  scenario "authorized user can create a kitchen" do
    kitchen = FactoryGirl.create(:kitchen)

    sign_in_as(kitchen.user)
    visit user_kitchen_path(kitchen.user, kitchen)

    click_on "Delete my kitchen"
    expect(page).to_not have_content(kitchen.name)
    expect(page).to have_content("Create your kitchen")
  end
end
