require 'rails_helper'

RSpec.describe Meal, :type => :model do
  let!(:meal) { FactoryGirl.create(:meal) }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :portion}
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:orders) }
  end
end
