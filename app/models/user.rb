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

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  # フォローしようとしているother_userが自分自身でないか
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  # relationshipが存在すればdestroy
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  # フォローしているユーザーを取得
  def following?(other_user)
    self.followings.include?(other_user)
  end

  #通知機能
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  # フォロー通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
  

  mount_uploader :user_image, ImageUploader
end
