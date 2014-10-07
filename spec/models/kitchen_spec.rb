require 'rails_helper'

RSpec.describe Kitchen, :type => :model do
  let!(:kitchen) { FactoryGirl.create(:kitchen) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zipcode }

end
