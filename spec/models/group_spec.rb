require 'rails_helper'

describe Group, type: :model do
  describe '#create' do
    context 'groupを保存できる場合' do
      it 'group_nameがあれば保存できる' do
        expect(build(:group)).to be_valid
      end
    end

    context 'groupが保存できない場合' do
      it "group_nameが空だと保存できない" do
        group = build(:group, group_name: nil)
        group.valid?
        expect(group.errors[:group_name]).to include('を入力してください')
      end
    end
  end
end