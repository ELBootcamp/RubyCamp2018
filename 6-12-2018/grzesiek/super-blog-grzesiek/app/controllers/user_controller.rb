class UserController < ApplicationController

  def profile
    @user_posts = Post.where(user_id: current_user)
    @other_users_posts = Post.where.not(user_id: current_user)
  end

  def nick
    @user = User.find(current_user.id)
  end

  def add_nick
    current_user.update(user_params)

    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:nick)
  end

end
