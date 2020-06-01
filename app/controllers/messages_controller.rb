class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: [:index]
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      @message.create_notification_message!(current_user, @message.id, @group.id)
      respond_to do |format|
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :index
    end
  end

  def destroy
    message = Message.find(params[:id])
    if message.destroy
      redirect_to group_messages_path(@group), notice: "メッセージを削除しました"
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = '削除できません'
      render :index
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:message_text, :message_image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def move_to_root
    @group = Group.find(params[:group_id])
    joining_group = GroupUser.find_by(user_id: current_user.id, group_id: @group.id)
    if  joining_group.nil?
      redirect_to root_path
    end
  end

end
