require 'rails_helper'

describe Recipecomment, type: :model do
  describe "#create" do

    context "recipecommentを保存できる場合" do
      it "commentがあれば保存できる" do
        expect(build(:recipecomment)).to be_valid
      end

      it "commentが60字以内で保存できる" do
        recipe = build(:recipecomment, comment: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(build(:recipecomment)).to be_valid
      end
    end

    context "recipecommentが保存できない場合" do
      it "commentがないと保存できない" do
        recipecomment = build(:recipecomment, comment: nil)
        recipecomment.valid?
        expect(recipecomment.errors[:comment]).to include('を入力してください')
      end

      it "commentが61字以上では保存できない" do
        recipecomment = build(:recipecomment, comment: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        recipecomment.valid?
        expect(recipecomment.errors[:comment]).to include('は60文字以内で入力してください')
      end

      it 'user_idがないと保存できない' do
        recipecomment = build(:recipecomment, user_id: nil)
        recipecomment.valid?
        expect(recipecomment.errors[:user]).to include("を入力してください")
      end
      
    end
  end
end