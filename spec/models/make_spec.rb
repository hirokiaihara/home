require 'rails_helper'

describe Make, type: :model do
  describe "#create" do

    context "makeを保存できる場合" do
      it "make_image, make_textがあれば保存できる" do
        expect(build(:make)).to be_valid
      end

      it "make_imageがあれば保存できる" do
        make = build(:make, make_text: nil)
        make.valid?
        expect(make).to be_valid
      end
      it "make_textがあれば保存できる" do
        make = build(:make, make_image: nil)
        make.valid?
        expect(make).to be_valid
      end
    end
  end
end