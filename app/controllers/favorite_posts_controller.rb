class FavoritePostsController < ApplicationController
  def new
    @favorite_post = FavoritePost.new
  end
  def create
    @favorite_post = FavoritePost.new(favorite_post_params)
    @favorite_post.user_id = current_user.id
    @favorite_post.save
    redirect_to favorite_posts_path
  end

  def index
    @favorite_posts = FavoritePost.page(params[:page])
  end


  def show
    @favorite_post = FavoritePost.find(params[:id])
    @favorite_post_image = @favorite_post.favorite_post_image
  end



  def edit
  end

  private

  def favorite_post_params
    params.require(:favorite_post).permit(:spot_name, :category, :body, :favorite_post_image)
  end

end
