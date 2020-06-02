class Group < ApplicationRecord
  has_many :group_users,  dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages,     dependent: :destroy

  has_many :notifications, dependent: :destroy

  validates :group_name, presence: true
  # 最後の投稿者を表示
  def show_last_member
    if (last_message = messages.last).present?
      last_message.user.nickname + 'が投稿しました'
    else
      'まだメッセージがありません'
    end
  end

  def create_notification_group!(current_user, group_id)
    # 自分以外にグループに追加している人をすべて取得し、全員に通知を送る
    temp_ids = Group.joins(:group_users).select(:user_id).where('group_users.group_id': group_id).where.not('group_users.user_id': current_user.id).distinct
    if temp_ids.present?
      temp_ids.each do |temp_id|
        save_notification_group!(current_user, group_id, temp_id['user_id'])
      end
    end
  end

  def save_notification_group!(current_user, group_id, visited_id)
    notification = current_user.active_notifications.new(
      group_id: group_id,
      visited_id: visited_id,
      action: 'add_group'
    )
    notification.save if notification.valid?
  end
end
