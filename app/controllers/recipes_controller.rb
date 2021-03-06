class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_recipe, except: [:index, :new, :create, :search]
  before_action :move_to_root, only: [:edit]

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
      flash[:alert] = "更新できません"
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def search
    @title = params[:keyword]
    @recipes = Recipe.includes(:foods, :makes).search(params[:keyword]).order('recipes.created_at desc').page(params[:page]).per(12)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_image, :recipe_introduction, :category, foods_attributes: [:food_name, :quantity, :_destroy, :id], makes_attributes: [:make_image, :make_text, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_root
    @recipe = Recipe.find(params[:id])
    if  @recipe.user_id != current_user.id
      redirect_to root_path
    end
  end
end
