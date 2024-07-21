class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報のアップデートが完了しました！"
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

end
