class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @posts = Post.this_month
  end
end
