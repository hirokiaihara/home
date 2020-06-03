require 'rails_helper'

describe Food, type: :model do
  describe "#create" do

    context "foodを保存できる場合" do
      it "food_name, quantityがあれば保存できる" do
        expect(build(:food)).to be_valid
      end

      it "food_nameがあれば保存できる" do
        food = build(:food, quantity: nil)
        food.valid?
        expect(food).to be_valid
      end
      it "quantityがあれば保存できる" do
        food = build(:food, food_name: nil)
        food.valid?
        expect(food).to be_valid
      end
    end
  end
end
