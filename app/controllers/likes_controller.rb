class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_play

  def create
    @play.create_notification_by(current_user)
    @like = Like.create(user_id: current_user.id, play_id: @play.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, play_id: @play.id)
    @like.destroy
  end

  private

  def set_play
    @play = Play.find(params[:play_id])
  end
  
end
