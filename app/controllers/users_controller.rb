class UsersController < ApplicationController
	before_action :authenticate_user!

  def index
  	@users = User.all
  end

  def show
    # @users = User.all
  	@user = User.find(params[:id])
  	# @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to user_path(@user.id)
  end

  def follows
    @user = User.find(params[:id]) 
    @follows = @user.followings
  end

  def followers
    @user = User.find(params[:id])     
    @followers = @user.followers
  end

  def favorites
    @user = User.find(params[:id])
  end

private
  def users_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
