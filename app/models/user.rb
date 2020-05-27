class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :nickname, length: {maximum: 20}
  validates :user_introduction, length: {maximum: 60}
  
  has_many :plays,    dependent: :destroy
  has_many :playcomments, dependent: :destroy

  has_many :recipes,    dependent: :destroy
  has_many :recipecomments, dependent: :destroy

  has_many :likes,      dependent: :destroy
  has_many :myrecipes,      dependent: :destroy

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages,    dependent: :destroy

  mount_uploader :user_image, ImageUploader
end
