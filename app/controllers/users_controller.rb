class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
     else
       render 'edit'
     end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
