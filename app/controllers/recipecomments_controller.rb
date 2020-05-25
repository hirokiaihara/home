class RecipecommentsController < ApplicationController
  def create
    @recipecomment = Recipecomment.create(recipecomment_params)
    if @recipecomment.save
      redirect_to recipe_path(@recipecomment.recipe_id), notice: "送信しました"
    else
      redirect_to recipe_path(@recipecomment.recipe_id), alert: "送信できません"
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
