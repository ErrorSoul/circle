require 'pry'
class PostsController < ApplicationController
  respond_to :json
  before_action :set_post, only: [:edit, :update]

  def index
    @posts = Post.all
    render json: { posts: @posts }
    
  end
  

  def edit 
    @post = Post.find(params[:id])
    render json: { post: @post }
  end

  def update
    
    
    if @post.update_attributes(post_params)
      if @post.asset.filename
        #pry.binding
        render json: {message: "Your text saved", url: @post.asset.url}
      
      else
        render json: { message: "Your text saved" }
      end
     
    else
      render json: {errors: @post.errors.full_messages}
    end
  end

  private
   
    def set_post
      @post = Post.find(params[:id])
    end

    
    def post_params
      params.require(:post).permit(:title, :text, :asset)
    end
end
