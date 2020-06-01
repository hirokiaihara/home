class PlaysController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit]
  before_action :set_play, only: [:show, :edit, :update, :destroy]
  
  def index
    @plays = Play.includes(:materials, :works).order('plays.created_at desc').page(params[:page]).per(12)
  end

  def new
    @play = Play.new
    @play.materials.new
    @play.works.new
  end

  def create
    @play = Play.create(play_params)
    if @play.save
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      flash[:alert] = "投稿できません"
      render :new
    end
  end

  def show
    @playcomment = Playcomment.new
    @playcomments = @play.playcomments.includes(:user).order('playcomments.created_at desc').page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @play.update(play_params)
      flash[:notice] = "更新しました"
      redirect_to root_path
    else
      flash[:alert] = "更新できません"
      render :edit
    end
  end

  def destroy
    @play.destroy
    redirect_to root_path
  end

  def search
    @title = params[:keyword]
    @plays = Play.includes(:materials, :works).search(params[:keyword]).order('plays.created_at desc').page(params[:page]).per(12)
  end
  
  private

  def play_params
    params.require(:play).permit(:play_title, :play_image, :play_introduction, :category, materials_attributes: [:material_name, :_destroy, :id], works_attributes: [:work_image, :work_text, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_play
    @play = Play.find(params[:id])
  end

  def move_to_root
    @play = Play.find(params[:id])
    if  @play.user_id != current_user.id
      redirect_to root_path
    end
  end

end
