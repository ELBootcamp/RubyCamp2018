class UserController < ApplicationController

  def profile
    @user_posts = Post.where(user_id: current_user)
    @other_users_posts = Post.where.not(user_id: current_user)
  end

end
