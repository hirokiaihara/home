require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:like) { create(:like) }

  it "likeインスタンスが有効である事" do
    expect(like).to be_valid
  end

  it "user_idがnilの場合、無効である事" do
    like.user_id = nil
    expect(like).not_to be_valid
  end

  it "play_idがnilの場合、無効である事" do
    like.play_id = nil
    expect(like).not_to be_valid
  end
end