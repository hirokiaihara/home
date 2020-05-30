class Play < ApplicationRecord
  validates :play_title, :play_image, :play_introduction, :category, presence: true
  validates :play_title, length: {maximum: 20}
  validates :play_introduction, length: {maximum: 60}

  belongs_to :user
  has_many :materials, dependent: :destroy
  has_many :works,     dependent: :destroy
  has_many :playcomments,  dependent: :destroy
  has_many :likes,     dependent: :destroy
  has_many :notifications, dependent: :destroy

  accepts_nested_attributes_for :materials, allow_destroy: true
  accepts_nested_attributes_for :works, allow_destroy: true

  mount_uploader :play_image, ImageUploader
  # 検索機能
  def self.search(search)
    return Play.all unless search
    Play.joins(:materials).where('play_title LIKE(?) OR category LIKE(?) OR materials.material_name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
  end
  # ランキング
  def self.create_ranks
    Play.find(Like.group(:play_id).order('count(play_id) desc').limit(3).pluck(:play_id))
  end
  # いいね通知機能
  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      play_id: id,
      visited_id: user_id,
      action: "like"
    )
    notification.save if notification.valid?
  end
  # コメント通知機能
  def save_notification_playcomment!(current_user, playcomment_id, visited_id)
    notification = current_user.active_notifications.new(
      play_id: id,
      playcomment_id: playcomment_id,
      visited_id: visited_id,
      action: 'playcomment'
    )
    notification.save if notification.valid?
  end
end
