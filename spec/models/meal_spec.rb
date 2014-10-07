require 'rails_helper'

RSpec.describe Meal, :type => :model do
  let!(:meal) { FactoryGirl.create(:meal) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :portion}

end
