require 'rails_helper'

describe PlaysController do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@playに正しい値が入っていること" do
      play = create(:play)
      get :edit, params: {id: play}
      expect(assigns(:play)).to eq play
    end

    it "edit.html.hamlに遷移すること" do
      play = create(:play)
      get :edit, params: {id: play}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it '@playsに正しい値が入っていること' do
      plays = create_list(:play, 3)
      get :index
      expect(assigns(:plays)).to match(plays.sort{ |a, b| b.created_at <=> a.created_at} )
    end

    it 'index.html.hamlに遷移すること' do
      get :index
      expect(response).to render_template :index
    end
  end
end