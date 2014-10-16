class Kitchen < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :city, presence: true, length: { maximum: 255 }
  validates :state, presence: true, length: { maximum: 255 }
  validates :zipcode, presence: true, length: { maximum: 5 }

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
