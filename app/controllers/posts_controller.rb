class PostsController < ApplicationController


  def home
    @posts = Post.all.limit(6)
  end


  def index
    @posts = Post.all
  end


  def show
    @post = Post.find_by_id(params[:id])
    redirect_to posts_url if @post.nil?
  end


end
