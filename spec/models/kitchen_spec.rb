require 'rails_helper'

describe Kitchen do
  let!(:kitchen) { FactoryGirl.create(:kitchen) }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zipcode }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:reviews) }
  end
end
