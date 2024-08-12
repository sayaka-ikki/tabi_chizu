class FavoritePostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @favorite_post = FavoritePost.new
  end

  def create
    @favorite_post = FavoritePost.new(favorite_post_params)
    @favorite_post.user_id = current_user.id
    if @favorite_post.save
      redirect_to favorite_post_path(@favorite_post.id)
    else
      render :new
    end
  end

  def index
    @favorite_posts = FavoritePost.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @favorite_post = FavoritePost.find(params[:id])
    @favorite_post_comment = FavoritePostComment.new
    @favorite_post_comments = @favorite_post.favorite_post_comments.active
  end

  def edit
    @favorite_post = FavoritePost.find(params[:id])
  end

  def update
    @favorite_post = FavoritePost.find(params[:id])
    if @favorite_post.update(favorite_post_params)
      flash[:notice] = "お気に入りスポットの編集が完了しました！"
      redirect_to favorite_post_path(@favorite_post.id)
    else
      render :edit
    end
  end

  def destroy
    @favorite_post = FavoritePost.find(params[:id])
    if @favorite_post.destroy
      flash[:notice] = "お気に入りスポット投稿を削除しました。"
      redirect_to favorite_posts_path
    end
  end

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @favorite_posts = FavoritePost.looks(params[:search], params[:word])
    end
  end

  def category
    @category = params[:category]
    @favorite_posts = FavoritePost.where(category: @category).page(params[:page]).per(10)
  end

  private

  def favorite_post_params
    params.require(:favorite_post).permit(:spot_name, :category, :body, :favorite_post_image)
  end

  def correct_user
    @favorite_post = current_user.favorite_posts.find_by(id: params[:id])
    redirect_to favorite_post_path(params[:id]) if @favorite_post.nil?
  end
end
