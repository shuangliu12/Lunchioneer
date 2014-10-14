require "rails_helper"

feature "authenticated user can edit or delete kitchen" do
  scenario "unauthenticated user cannot see the edit or delete button" do
    kitchen = FactoryGirl.create(:kitchen)
    unauthorized_user = FactoryGirl.create(:user)
    authorized_user = kitchen.user

    sign_in_as(unauthorized_user)
    visit user_kitchen_path(kitchen.user, kitchen)

    expect(page).to_not have_content("edit")
    expect(page).to_not have_content("delete")
  end

  scenario "authorized user get errors if use fails to fill out the required field" do
    kitchen = FactoryGirl.create(:kitchen)

    sign_in_as(kitchen.user)
    visit user_kitchen_path(kitchen.user, kitchen)

    first(:link, "edit").click
    fill_in("Name", with: "")
    click_on "Update Kitchen"

    expect(page).to have_content("You need to fill out the required fields.")
  end

  scenario "authorized user can delete a kitchen" do
    kitchen = FactoryGirl.create(:kitchen)

    sign_in_as(kitchen.user)
    visit user_kitchen_path(kitchen.user, kitchen)

    first(:link,"delete").click
    expect(page).to_not have_content(kitchen.name)
    expect(page).to have_content("Create your kitchen")
  end

  scenario "user can update kitchen profile" do
    user = FactoryGirl.create(:user)
    kitchen = FactoryGirl.create(:kitchen, user: user)

    sign_in_as(user)
    visit edit_user_kitchen_path(user, kitchen)

    fill_in("Name", with: "Irish")
    attach_file "Kitchen photo", Rails.root.join('spec/fixtures/img.jpg')
    click_on 'Update Kitchen'
    expect(page).to have_content("Irish")
    expect(page).to have_content("You have successfully updated your kitchen profile")
  end
end
