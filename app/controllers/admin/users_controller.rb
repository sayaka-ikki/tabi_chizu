class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end

  def toggle_status
    @user = User.find(params[:id])
    @user.update(status: !@user.status)

    if @user.status
      flash[:notice] = "退会処理を実行いたしました"
    else
      flash[:notice] = "有効にしました"
    end

    redirect_to admin_user_path(@user)
  end
end
