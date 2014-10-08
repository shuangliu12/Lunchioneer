class Review < ActiveRecord::Base
  validates :user_id, presence: true
  validates :kitchen_id, presence: true
  validates :body, presence: true
  validates :rating, presence: true

  belongs_to :user
  belongs_to :kitchen
end
