class Meal < ActiveRecord::Base
  validates :name, presence:true
  validates :price, presence:true
  validates :portion, presence:true

  belongs_to :user
  has_many :orders

  def portion_remaining

  end
end
