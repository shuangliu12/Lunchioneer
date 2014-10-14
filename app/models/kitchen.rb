class Kitchen < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy

  paginates_per 1

  mount_uploader :kitchen_photo, KitchenPhotoUploader

  def self.search(search)
    result = where("city ilike :q", q: "%#{search}%")
    if result.empty?
      return self.all
    end
    result
  end

  def cal_rating
    if Review.where(kitchen_id: self.id).count > 0
      Review.where(kitchen_id: id).sum(:rating) / Review.where(kitchen_id: id).count
    else
      0
    end
  end
end
