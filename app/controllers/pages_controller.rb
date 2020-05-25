class PagesController < ApplicationController
  def index
    @plays = Play.includes(:materials, :works)
    @recipes = Recipe.includes(:foods, :makes)
  end
end
