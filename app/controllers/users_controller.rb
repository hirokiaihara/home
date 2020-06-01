class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :myrecipes]
  before_action :move_to_root, only: [:myrecipes]
  before_action :set_user, only: [:show, :show_plays, :show_recipes, :show_follows, :show_followers]
  def index
    return nil if params[:keyword] == ""
    @users = User.where(['nickname LIKE ?', "%#{params[:keyword]}%"]).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end
  # マイページ
  def show
    @plays = @user.plays.order('created_at DESC').limit(4)
    @recipes = @user.recipes.order('created_at DESC').limit(4)
  end

  def show_plays
    @plays = @user.plays.order('created_at DESC').page(params[:page]).per(12)
  end

  def show_recipes
    @recipes = @user.recipes.order('created_at DESC').page(params[:page]).per(12)
  end
  # マイフォルダ
  def myrecipes
    @likes = Like.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(8)
    @myrecipes = Myrecipe.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(8)
  end
  # フォローしている人一覧
  def show_follows
    @title = "Follows"
    @users = @user.followings.order('created_at DESC')
    render 'show_follow'
  end
  # フォロワー一覧
  def show_followers
    @title = "Followers"
    @users = @user.followers.order('created_at DESC')
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_root
    @user = User.find(params[:id])
    if  @user.id != current_user.id
      redirect_to root_path
    end
  end
  
end
