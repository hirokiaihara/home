class RecipecommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @recipecomment = Recipecomment.create(recipecomment_params)
    @commented_recipe = @recipecomment.recipe
    if @recipecomment.save
      @commented_recipe.save_notification_recipecomment!(current_user, @recipecomment.id, @commented_recipe.user_id)
      redirect_to recipe_path(@recipecomment.recipe_id), notice: "送信しました"
    else
      redirect_to recipe_path(@recipecomment.recipe_id), alert: "コメントを入力してください"
    end
  end

  def destroy
    recipecomment = Recipecomment.find(params[:id])
    if recipecomment.destroy
      redirect_to recipe_path(recipecomment.recipe_id), notice: "削除しました"
    else
      redirect_to recipe_path(recipecomment.recipe_id), alert: "削除できません"
    end
  end

  private

  def recipecomment_params
    params.require(:recipecomment).permit(:comment).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
  
end
