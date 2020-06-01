class PagesController < ApplicationController
  def index
    # 新着投稿を表示
    @plays = Play.includes(:materials, :works).order('plays.created_at desc').page(params[:page]).per(8)
    @recipes = Recipe.includes(:foods, :makes).order('recipes.created_at desc').page(params[:page]).per(6)
    # ランキングを表示
    @ranked_plays = Play.includes(:materials, :works).create_ranks
    @ranked_recipes = Recipe.includes(:foods, :makes).create_ranks
  end

  def guide
  end
  
end
