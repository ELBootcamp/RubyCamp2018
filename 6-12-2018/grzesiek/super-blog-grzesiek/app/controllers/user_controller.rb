class UserController < ApplicationController
  def index
    @posts = Post.this_week
  end

end
