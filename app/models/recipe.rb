class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :recipe_title, :recipe_image, :recipe_introduction, :recipecategory_id, presence: true
  validates :recipe_title, length: {maximum: 20}
  validates :recipe_introduction, length: {maximum: 60}

  belongs_to :user
  has_many :foods, dependent: :destroy
  has_many :makes, dependent: :destroy
  has_many :recipecomments, dependent: :destroy

  accepts_nested_attributes_for :foods, allow_destroy: :true
  accepts_nested_attributes_for :makes, allow_destroy: :true

  mount_uploader :recipe_image, ImageUploader

  belongs_to_active_hash :recipecategory
end
