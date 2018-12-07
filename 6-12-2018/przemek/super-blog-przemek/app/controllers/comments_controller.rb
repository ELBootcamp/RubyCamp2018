class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = post

    @comment.save
    redirect_to post
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end
end
