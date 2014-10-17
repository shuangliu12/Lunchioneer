require "rails_helper"

feature "authenticated user can create a kitchen" do
  scenario "authenticated user can create a kitchen"do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit new_user_kitchen_path(user)

    fill_in("Name", with: "Italian Food")
    fill_in("Description", with: "authentic food" )
    fill_in("Address", with: "30 Oak St")
    fill_in("City", with: "Boston")
    fill_in("State", with: "MA")
    fill_in("Zipcode", with: "02111")

    click_on "Create Kitchen"
    expect(page).to have_content("Italian Food")
  end

  scenario "authenticated user gets errors if user fails to fill out required fields" do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit new_user_kitchen_path(user)

    click_on "Create Kitchen"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zipcode can't be blank")
    expect(page).to have_content("errors")
  end
end
