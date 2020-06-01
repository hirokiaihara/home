class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @notifications = current_user.passive_notifications
    # 通知一覧を開いたらチェック済みにする
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
  
  def destroy_all
    @notifications = current_user.passive_notifications
    if @notifications.destroy_all
      redirect_to notifications_path, notice: "通知を削除しました"
    else
      redirect_to notifications_path, notice: "削除出来ません"
    end
  end
    
end
