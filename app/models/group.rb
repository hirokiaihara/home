class Group < ApplicationRecord
  has_many :group_users,  dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages,     dependent: :destroy

  validates :group_name, presence: true

  def show_last_member
    if (last_message = messages.last).present?
      last_message.user.nickname + 'が投稿しました'
    else
      'まだメッセージがありません'
    end
  end

end
