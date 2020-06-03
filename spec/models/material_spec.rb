require 'rails_helper'

describe Material, type: :model do
  describe "#create" do
    
    context "materialを保存できる場合" do
      it "material_nameがあれば保存できる" do
        expect(build(:material)).to be_valid
      end
    end
  end
end