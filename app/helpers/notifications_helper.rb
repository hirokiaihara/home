module NotificationsHelper
  # 通知文を場合分け
  def notification_form(notification)
    @playcomment = nil
    @recipecomment = nil
    @message = nil
    visiter = link_to notification.visiter.nickname, notification.visiter
    case notification.action
      when "follow" then
        visiter + "があなたをフォローしました"
      when "like" then
        your_play = link_to "あなたの投稿", notification.play
        visiter + "が" + your_play + "にいいねしました"
      when "playcomment" then
        your_play = link_to "あなたの投稿", notification.play
        @playcomment = Playcomment.find_by(id: notification.playcomment_id)
        visiter + "が" + your_play + "にコメントしました"
      when "recipecomment" then
        your_recipe = link_to "あなたのレシピ", notification.recipe
        @recipecomment = Recipecomment.find_by(id: notification.recipecomment_id)
        visiter + "が" + your_recipe + "にコメントしました"
      when "message" then
        your_group = link_to notification.group.group_name, "/groups/#{notification.group_id}/messages"
        @message = Message.find_by(id: notification.message_id)
        visiter + "が" + your_group + "にメッセージを送りました"
    end
  end
  # 未確認の通知がある時にヘッダーでお知らせする
  def unchecked_notifications
    @uncheck = current_user.passive_notifications.where(checked: false).where.not(visiter_id: current_user.id)
  end
end

