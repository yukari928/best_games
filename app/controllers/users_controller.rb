class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts_path
    end
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
