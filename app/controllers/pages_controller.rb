class PagesController < ApplicationController
  def index
    @plays = Play.includes(:materials, :works).order('plays.created_at desc').page(params[:page]).per(8)
    @recipes = Recipe.includes(:foods, :makes).order('recipes.created_at desc').page(params[:page]).per(6)
    @ranked_plays = Play.includes(:materials, :works).create_ranks
    @ranked_recipes = Recipe.includes(:foods, :makes).create_ranks
  end

  def show
    @likes = Like.includes(:plays).order('likes.created_at desc').page(params[:page]).per(12)
  end
end
