class PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.all
    render json: { posts: @posts }
    
  end
end
