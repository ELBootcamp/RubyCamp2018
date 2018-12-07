class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @posts = Post.where(published: true).this_month
  end
end
