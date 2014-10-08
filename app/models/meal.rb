class Meal < ActiveRecord::Base
  validates :name, presence:true
  validates :price, presence:true
  validates :portion, presence:true

  belongs_to :user
  has_many :orders

  paginates_per 5

  def self.search(query)
    if search.present?
      # where("zipcode ilike :, :", q:'%{search}%') by distance
    else
      self.all
    end
  end

  def owner?(user)
    self.user = user
  end
end
