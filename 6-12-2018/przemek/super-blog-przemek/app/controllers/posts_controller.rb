class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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
    # make it unable to edit someone else post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end


  def destroy
    # make it unable to destroy someone else post
    @post.destroy

    redirect_to users_path
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
