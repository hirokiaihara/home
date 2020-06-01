class MyrecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe

  def create
    @myrecipe = Myrecipe.create(user_id: current_user.id, recipe_id: @recipe.id)
  end

  def destroy
    @myrecipe = Myrecipe.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @myrecipe.destroy
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
