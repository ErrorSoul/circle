require 'pry'
class PostsController < ApplicationController
  respond_to :json
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :message_dict, only: [:update, :create ]

  def index
    @posts = Post.all
    render json: { posts: @posts }
    
  end
  

  def edit 
    render json: { post: @post }
  end

  def create 
    @post = Post.new(post_params)
    if @post.save 
      check_asset
      render json: @message 
    else
      render json: {errors: @post.errors.full_messages }
    end
  end

  def update
    
    if @post.update_attributes(post_params)
     check_asset
     render json: @message
    else
      render json: {errors: @post.errors.full_messages}
    end
  end


  def destroy
    @post.destroy
    render json: {message: "Your post deleted"}
  end

  private
   
    def set_post
      @post = Post.find(params[:id])
    end

    
    def post_params
      params.require(:post).permit(:title, :text, :asset)
    end

    def message_dict 
      @message = {message: "Your text saved"}
    end
    
    def check_asset
      if @post.asset.filename
        @message[:url] = @post.asset.url
        
      end
    end
          
        
end
