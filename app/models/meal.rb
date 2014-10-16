class Meal < ActiveRecord::Base
  validates :name, presence:true, length: { maximum: 255 }
  validates :price, presence:true, numericality: { only_integer: true }
  validates :portion, presence:true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :meal_date, presence: true

  belongs_to :user
  has_many :orders, dependent: :destroy

  paginates_per 5
end
