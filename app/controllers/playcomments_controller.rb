class PlaycommentsController < ApplicationController
  def create
    @playcomment = Playcomment.create(playcomment_params)
    if @playcomment.save
      redirect_to play_path(@playcomment.play_id), notice: "送信しました"
    else
      redirect_to play_path(@playcomment.play_id), alert: "送信できません"
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
