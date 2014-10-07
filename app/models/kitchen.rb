class Kitchen < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  belongs_to :user
  has_many :meals
  paginates_per 1
end
