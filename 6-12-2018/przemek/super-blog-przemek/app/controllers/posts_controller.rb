class PostsController < ApplicationController

  def index 
    redirect_to profile_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update 
    if @post.update
      redirect_to @post
    else
      render :edit
    end
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
