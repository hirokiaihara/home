class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  has_many :notifications, dependent: :destroy

  validates :message_text, presence: true, unless: :message_image?

  mount_uploader :message_image, ImageUploader

  # グループにメッセージがあった時に通知
  def create_notification_message!(current_user, message_id, group_id)
    # 自分以外にメッセージしている人をすべて取得し、全員に通知を送る
    temp_ids = Group.joins(:group_users).select(:user_id).where('group_users.group_id': group_id).where.not('group_users.user_id': current_user.id).distinct
    if temp_ids.present?
      temp_ids.each do |temp_id|
        save_notification_message!(current_user, message_id, group_id, temp_id['user_id'])
      end
    end
  end

  def save_notification_message!(current_user, message_id, group_id, visited_id)
    notification = current_user.active_notifications.new(
      group_id: group_id,
      message_id: message_id,
      visited_id: visited_id,
      action: 'message'
    )
    notification.save if notification.valid?
  end
end
