class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user), notice: 'User created.' }
      else
        format.html { render :new }
      end
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: 'Update successful.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy 
    user = User.find(params[:id])
    user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User deleted.' }
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :age)
  end
end