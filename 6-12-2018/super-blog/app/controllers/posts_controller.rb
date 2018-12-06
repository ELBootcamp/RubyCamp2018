class PostsController < ApplicationController
  def index
    @posts = BlogPost.this_week
  end

  def new
    @post = BlogPost.new
  end

  def create
    post = BlogPost.new(post_params)

    post.user = current_user
    if post.save
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:blog_post).permit(:title, :content)
  end
end
