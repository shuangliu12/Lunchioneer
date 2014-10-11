require 'rails_helper'
  describe Review do
  let!(:review) { FactoryGirl.create(:review) }

  describe 'validations' do
    it { should validate_presence_of :rating }
    it { should validate_presence_of :body }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:kitchen) }
  end
end
