require 'pry'
class TasksController < ApplicationController

  def new
    @post = Post.new
  end


  def create 
    
    @post = Post.new(post_params)
    if @post.save
      render action: 'edit'
    else 
     render action: 'new'
    end
  end


    
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :asset)
    end
end
