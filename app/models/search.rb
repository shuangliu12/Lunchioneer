class Search < ActiveRecord::Base
  attr_accessible :date, :location
  belongs_to :user
end
