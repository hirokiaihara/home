class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      @user.create_notification_follow!(current_user)
      flash[:notice] = 'フォローしました'
      redirect_to @user
    else
      flash.now[:alert] = 'フォローできません'
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = 'フォロー解除'
      redirect_to @user
    else
      flash.now[:alert] = '解除失敗'
      redirect_to @user
    end
  end


  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end

end
