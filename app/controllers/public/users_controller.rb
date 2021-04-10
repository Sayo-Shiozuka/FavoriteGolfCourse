class Public::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to public_user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user.id), notice: 'You have updated user successfully'
    else
      render :edit
    end
  end

  def followings
  end

  def followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :address, :profile_image, :email)
  end

end