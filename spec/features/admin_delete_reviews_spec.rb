require 'rails_helper'

feature 'admin can delete reviews' do

  let(:admin) { FactoryGirl.create(:user, admin: true) }

  scenario 'admin can delete reviews'do
    review = FactoryGirl.create(:review)

    sign_in_as(admin)

    visit admin_kitchen_path(review.kitchen)
    click_on "delete"
    expect(page).to_not have_content(review.body)
  end
end
