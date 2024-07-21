class FavoritePostsController < ApplicationController
  def new
    @favorite_post = FavoritePost.new
  end

  def create
    @favorite_post = FavoritePost.new(favorite_post_params)
    @favorite_post.user_id = current_user.id
    @favorite_post.save
    redirect_to favorite_post_path(@favorite_post.id)
  end


  def index
    @favorite_posts = FavoritePost.page(params[:page])
  end


  def show
    @favorite_post = FavoritePost.find(params[:id])
  end


  def edit
      @favorite_post = FavoritePost.find(params[:id])
  end

  def update
    @favorite_post = FavoritePost.find(params[:id])
    if @favorite_post.update(favorite_post_params)
      flash[:notice] = "お気に入りスポットの編集が完了しました！"
      redirect_to favorite_post_path(@favorite_post.id)
    end
  end

  def destroy
    @favorite_post = FavoritePost.find(params[:id])
    if @favorite_post.destroy
      flash[:notice] = "お気に入りスポット投稿を削除しました。"
      redirect_to favorite_posts_path
    end
  end

  private

  def favorite_post_params
    params.require(:favorite_post).permit(:spot_name, :category, :body, :favorite_post_image)
  end

end
