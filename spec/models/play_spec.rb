require 'rails_helper'

describe Play, type: :model do
  describe "#create" do

    context "playを保存できる場合" do
      it "play_title, play_image, play_introduction, categoryがあれば保存できる" do
        expect(build(:play)).to be_valid
      end

      it "play_titleが20字以内で保存できる" do
        play = build(:play, play_title: "aaaaaaaaaaaaaaaaaaaa")
        expect(build(:play)).to be_valid
      end

      it "play_introductionが60字以内で保存できる" do
        play = build(:play, play_introduction: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(build(:play)).to be_valid
      end
    end

    context "playが保存できない場合" do
      it "play_titleがないと保存できない" do
        play = build(:play, play_title: nil)
        play.valid?
        expect(play.errors[:play_title]).to include('を入力してください')
      end

      it "play_imageがないと保存できない" do
        play = build(:play, play_image: nil)
        play.valid?
        expect(play.errors[:play_image]).to include("を入力してください")
      end

      it "play_introductionがないと保存できない" do
        play = build(:play, play_introduction: nil)
        play.valid?
        expect(play.errors[:play_introduction]).to include("を入力してください")
      end

      it "categoryがないと保存できない" do
        play = build(:play, category: nil)
        play.valid?
        expect(play.errors[:category]).to include("を入力してください")
      end

      it "play_titleが21字以上で保存できない" do
        play = build(:play, play_title: "aaaaaaaaaaaaaaaaaaaaa")
        play.valid?
        expect(play.errors[:play_title]).to include("は20文字以内で入力してください")
      end

      it "play_introductionが61字以上で保存できない" do
        play = build(:play, play_introduction: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        play.valid?
        expect(play.errors[:play_introduction]).to include("は60文字以内で入力してください")
      end

      it 'user_idがないと保存できない' do
        play = build(:play, user_id: nil)
        play.valid?
        expect(play.errors[:user]).to include("を入力してください")
      end
    end
  end
end
