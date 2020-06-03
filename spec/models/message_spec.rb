require 'rails_helper'

describe Message, type: :model do
  describe '#create' do
    context 'messageを保存できる場合' do
      it 'message_textがあれば保存できる' do
        expect(build(:message, message_image: nil)).to be_valid
      end

      it 'message_imageがあれば保存できる' do
        expect(build(:message, message_text: nil)).to be_valid
      end

      it 'message_textとmessage_imageがあれば保存できる' do
        expect(build(:message)).to be_valid
      end
    end

    context 'messageが保存できない場合' do
      it "message_textとmessge_imageが両方空だと保存できない" do
        message = build(:message, message_text: nil, message_image: nil)
        message.valid?
        expect(message.errors[:message_text]).to include('を入力してください')
      end

      it "group_idがないと保存できない" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end

      it "user_idがないと保存できない" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include('を入力してください')
      end
    end
  end
end