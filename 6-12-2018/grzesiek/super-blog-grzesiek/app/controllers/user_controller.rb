class UserController < ApplicationController

  def index
    @posts = Post.where(user_id: current_user)
  end

end
