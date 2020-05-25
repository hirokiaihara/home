class RecipesController < ApplicationController
  before_action :set_recipe, except: [:index, :new, :create]

  def index
    @recipes = Recipe.includes(:foods, :makes).order('recipes.created_at desc').page(params[:page]).per(12)
  end

  def new
    @recipe = Recipe.new
    @recipe.foods.new
    @recipe.makes.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      flash[:alert] = "投稿できません"
      render :new
    end
  end

  def show
    @recipecomment = Recipecomment.new
    @recipecomments = @recipe.recipecomments.includes(:user).order('recipecomments.created_at desc').page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "更新しました"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_image, :recipe_introduction, :recipecategory_id, foods_attributes: [:food_name, :quantity, :_destroy, :id], makes_attributes: [:make_image, :make_text, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
