class Order < ActiveRecord::Base
  validates :user_id, presence: true
  validates :meal_id, presence: true

  belongs_to :user
  belongs_to :meal

  mount_uploader :profile_photo, KitchenPhotoUploader
end
