class Recipe < ApplicationRecord
  validates :recipe_title, :recipe_image, :recipe_introduction, :category, presence: true
  validates :recipe_title, length: {maximum: 20}
  validates :recipe_introduction, length: {maximum: 60}

  belongs_to :user
  has_many :foods, dependent: :destroy
  has_many :makes, dependent: :destroy
  has_many :recipecomments, dependent: :destroy
  has_many :myrecipes,     dependent: :destroy
  has_many :notifications, dependent: :destroy

  accepts_nested_attributes_for :foods, allow_destroy: :true
  accepts_nested_attributes_for :makes, allow_destroy: :true

  mount_uploader :recipe_image, ImageUploader
  # 検索機能
  def self.search(search)
    return Recipe.all unless search
    Recipe.joins(:foods).where('recipe_title LIKE(?) OR category LIKE(?) OR foods.food_name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
  end
  # ランキング
  def self.create_ranks
    Recipe.find(Myrecipe.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end
  # コメント通知機能
  def save_notification_recipecomment!(current_user, recipecomment_id, visited_id)
    notification = current_user.active_notifications.new(
      recipe_id: id,
      recipecomment_id: recipecomment_id,
      visited_id: visited_id,
      action: 'recipecomment'
    )
    notification.save if notification.valid?
  end
end
