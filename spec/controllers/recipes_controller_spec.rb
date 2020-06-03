require 'rails_helper'

describe RecipesController do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@recipeに正しい値が入っていること" do
      recipe = create(:recipe)
      get :edit, params: {id: recipe}
      expect(assigns(:recipe)).to eq recipe
    end

    it "edit.html.hamlに遷移すること" do
      recipe = create(:recipe)
      get :edit, params: {id: recipe}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it '@recipesに正しい値が入っていること' do
      recipes = create_list(:recipe, 3)
      get :index
      expect(assigns(:recipes)).to match(recipes.sort{ |a, b| b.created_at <=> a.created_at} )
    end

    it 'index.html.hamlに遷移すること' do
      get :index
      expect(response).to render_template :index
    end
  end
end