class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # before_create :build_kitchen
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true

  has_one :kitchen
  has_many :meals
  has_many :orders
  has_many :reviews

  def is_admin?
    admin == true
  end
end
