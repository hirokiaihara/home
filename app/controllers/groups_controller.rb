class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  def index
    @groups = Group.joins(:group_users).where(group_users: {user_id: current_user.id})
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:group_name, user_ids: []).merge(created_user_id: current_user.id)
  end
  
  def set_group
    @group = Group.find(params[:id])
  end

end
