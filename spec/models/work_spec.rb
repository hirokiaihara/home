require 'rails_helper'

describe Work, type: :model do
  describe "#create" do

    context "workを保存できる場合" do
      it "work_image, work_textがあれば保存できる" do
        expect(build(:work)).to be_valid
      end

      it "work_imageがあれば保存できる" do
        work = build(:work, work_text: nil)
        work.valid?
        expect(work).to be_valid
      end
      it "work_textがあれば保存できる" do
        work = build(:work, work_image: nil)
        work.valid?
        expect(work).to be_valid
      end
    end
  end
end