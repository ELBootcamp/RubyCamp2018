class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)

    post.user = current_user

    if post.save
      redirect_to user_path, notice: 'Post has been created.'
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_path(@post), notice: 'Post updated successful.'
    else
      render :edit 
    end
  end

  def destroy
    @post.destroy

    redirect_to user_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
