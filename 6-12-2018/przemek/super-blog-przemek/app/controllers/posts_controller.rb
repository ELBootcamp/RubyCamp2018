class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :post_owner, only: [:edit, :update, :destroy]

  def index 
    redirect_to profile_path
  end

  def show
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
  end

  def update 
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end


  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_owner
    unless @post.user_id == current_user.id
      redirect_to posts_path
     end
  end
end
