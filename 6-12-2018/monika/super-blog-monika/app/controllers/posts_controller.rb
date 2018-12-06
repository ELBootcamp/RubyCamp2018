class PostsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit 
  end

  def update 
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Update successful.'
    else        
      render :edit 
    end
  end

  def destroy 
    @post.destroy
    redirect_to posts_path, notice: 'User deleted.' 
  end

  def set_user
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.this_week
  end

  def profile
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: 'Post created.' 
    else        
      render :new
    end 
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
