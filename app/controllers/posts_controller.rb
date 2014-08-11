class PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.all
    render json: { posts: @posts }
    
  end
  

  def edit 
    @post = Post.find(params[:id])
    render json: { post: @post }
  end
end
