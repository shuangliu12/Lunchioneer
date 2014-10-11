require 'rails_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }

  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_uniqueness_of :username }
    it { should validate_uniqueness_of :email }
  end

  describe 'associations' do
    it {should have_many(:reviews)}
    it {should have_one(:kitchen)}
    it {should have_many(:meals)}
  end
end
