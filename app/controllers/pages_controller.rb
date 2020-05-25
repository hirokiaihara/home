class PagesController < ApplicationController
  def index
    @plays = Play.includes(:materials, :works).order('plays.created_at desc').page(params[:page]).per(8)
    @recipes = Recipe.includes(:foods, :makes).order('recipes.created_at desc').page(params[:page]).per(6)
  end
end
