class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end

  def sign_out_user
    sign_out current_user
    redirect_to root_path
  end
end
