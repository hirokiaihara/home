require 'rails_helper'

RSpec.describe Myrecipe, type: :model do
  let!(:myrecipe) { create(:myrecipe) }

  it "myrecipeインスタンスが有効である事" do
    expect(myrecipe).to be_valid
  end

  it "user_idがnilの場合、無効である事" do
    myrecipe.user_id = nil
    expect(myrecipe).not_to be_valid
  end

  it "recipe_idがnilの場合、無効である事" do
    myrecipe.recipe_id = nil
    expect(myrecipe).not_to be_valid
  end
end