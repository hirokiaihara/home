require 'rails_helper'

describe Recipe, type: :model do
  describe "#create" do

    context "recipeを保存できる場合" do
      it "recipe_title, recipe_image, recipe_introduction, categoryがあれば保存できる" do
        expect(build(:recipe)).to be_valid
      end

      it "recipe_titleが20字以内で保存できる" do
        recipe = build(:recipe, recipe_title: "aaaaaaaaaaaaaaaaaaaa")
        expect(build(:recipe)).to be_valid
      end

      it "recipe_introductionが60字以内で保存できる" do
        recipe = build(:recipe, recipe_introduction: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(build(:recipe)).to be_valid
      end
    end

    context "recipeが保存できない場合" do
      it "recipe_titleがないと保存できない" do
        recipe = build(:recipe, recipe_title: nil)
        recipe.valid?
        expect(recipe.errors[:recipe_title]).to include('を入力してください')
      end

      it "recipe_imageがないと保存できない" do
        recipe = build(:recipe, recipe_image: nil)
        recipe.valid?
        expect(recipe.errors[:recipe_image]).to include("を入力してください")
      end

      it "recipe_introductionがないと保存できない" do
        recipe = build(:recipe, recipe_introduction: nil)
        recipe.valid?
        expect(recipe.errors[:recipe_introduction]).to include("を入力してください")
      end

      it "categoryがないと保存できない" do
        recipe = build(:recipe, category: nil)
        recipe.valid?
        expect(recipe.errors[:category]).to include("を入力してください")
      end

      it "recipe_titleが21字以上で保存できない" do
        recipe = build(:recipe, recipe_title: "aaaaaaaaaaaaaaaaaaaaa")
        recipe.valid?
        expect(recipe.errors[:recipe_title]).to include("は20文字以内で入力してください")
      end

      it "recipe_introductionが61字以上で保存できない" do
        recipe = build(:recipe, recipe_introduction: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        recipe.valid?
        expect(recipe.errors[:recipe_introduction]).to include("は60文字以内で入力してください")
      end

      it 'user_idがないと保存できない' do
        recipe = build(:recipe, user_id: nil)
        recipe.valid?
        expect(recipe.errors[:user]).to include("を入力してください")
      end
    end
  end
end
