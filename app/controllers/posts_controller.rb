class PostsController < ApplicationController
  
  def index
    @plays = Play.includes(:materials, :works)
  end
end
