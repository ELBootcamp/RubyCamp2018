class PostsController < ApplicationController
  def index
    @posts = Post.this_week
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)

    post.user = current_user

    if post.save
      redirect_to user_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
