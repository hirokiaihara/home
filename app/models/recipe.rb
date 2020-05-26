class Recipe < ApplicationRecord
  validates :recipe_title, :recipe_image, :recipe_introduction, :category, presence: true
  validates :recipe_title, length: {maximum: 20}
  validates :recipe_introduction, length: {maximum: 60}

  belongs_to :user
  has_many :foods, dependent: :destroy
  has_many :makes, dependent: :destroy
  has_many :recipecomments, dependent: :destroy

  accepts_nested_attributes_for :foods, allow_destroy: :true
  accepts_nested_attributes_for :makes, allow_destroy: :true

  mount_uploader :recipe_image, ImageUploader

end
