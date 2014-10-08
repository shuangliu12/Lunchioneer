require "rails_helper"

feature "Authenticated user can leave comment in the kitchen page" do
  scenario "Unathenticated user cannot leave comment" do
    kitchen = FactoryGirl.create(:kitchen)

  end
end
