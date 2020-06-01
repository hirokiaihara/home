class PlaycommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @playcomment = Playcomment.create(playcomment_params)
    @commented_play = @playcomment.play
    if @playcomment.save
      @commented_play.save_notification_playcomment!(current_user, @playcomment.id, @commented_play.user_id)
      redirect_to play_path(@playcomment.play_id), notice: "送信しました"
    else
      redirect_to play_path(@playcomment.play_id), alert: "コメントを入力してください"
    end
  end

  def destroy
    playcomment = Playcomment.find(params[:id])
    if playcomment.destroy
      redirect_to play_path(playcomment.play_id), notice: "削除しました"
    else
      redirect_to play_path(playcomment.play_id), alert: "削除できません"
    end
  end

  private

  def playcomment_params
    params.require(:playcomment).permit(:comment).merge(user_id: current_user.id, play_id: params[:play_id])
  end

end
