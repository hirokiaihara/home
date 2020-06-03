require 'rails_helper'

describe Playcomment, type: :model do
  describe "#create" do

    context "playcommentを保存できる場合" do
      it "commentがあれば保存できる" do
        expect(build(:playcomment)).to be_valid
      end

      it "commentが60字以内で保存できる" do
        play = build(:playcomment, comment: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(build(:playcomment)).to be_valid
      end
    end

    context "playcommentが保存できない場合" do
      it "commentがないと保存できない" do
        playcomment = build(:playcomment, comment: nil)
        playcomment.valid?
        expect(playcomment.errors[:comment]).to include('を入力してください')
      end

      it "commentが61字以上では保存できない" do
        playcomment = build(:playcomment, comment: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        playcomment.valid?
        expect(playcomment.errors[:comment]).to include('は60文字以内で入力してください')
      end

      it 'user_idがないと保存できない' do
        playcomment = build(:playcomment, user_id: nil)
        playcomment.valid?
        expect(playcomment.errors[:user]).to include("を入力してください")
      end
      
    end
  end
end