require 'rails_helper'
  describe Review do
  let!(:review) { FactoryGirl.create(:review) }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :body }
end
