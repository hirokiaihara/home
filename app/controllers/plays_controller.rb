class PlaysController < ApplicationController
  
  def new
    @play = Play.new
    @play.materials.new
    @play.works.new
  end

  def create
    # binding.pry
    @play = Play.create(play_params)
    if @play.save
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      flash[:alert] = "投稿できません"
      render :new
    end
  end

  def edit
  end

  def update
  end
  

  private

  def play_params
    params.require(:play).permit(:play_title, :play_image, :play_introduction, :playcategory_id, materials_attributes: [:material_name, :_destroy, :id], works_attributes: [:work_image, :work_text, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
