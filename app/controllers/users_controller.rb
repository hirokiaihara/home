class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_plays, :show_recipes]

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

  def myrecipes
    @likes = Like.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(8)
    @myrecipes = Myrecipe.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(8)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
end
