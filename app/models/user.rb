class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # before_create :build_kitchen
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true

  mount_uploader :profile_photo, ProfilePhotoUploader

  has_one :kitchen, dependent: :nullify
  has_many :meals, dependent: :nullify
  has_many :orders, dependent: :nullify

  def is_admin?
    admin == true
  end
end
