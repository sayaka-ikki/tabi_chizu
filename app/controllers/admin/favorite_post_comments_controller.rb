class Admin::FavoritePostCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def show
    @favorite_post_comment = FavoritePostComment.find(params[:id])
  end

  def destroy
    @favorite_post_comment = FavoritePostComment.find(params[:id])
    @favorite_post_comment.destroy
    redirect_to admin_dashboards_path, notice: 'コメントが削除されました。'
  end

  def toggle_status
    @favorite_post_comment = FavoritePostComment.find(params[:id])
    @favorite_post_comment.update(status: !@favorite_post_comment.status)
    redirect_to admin_favorite_post_comment_path(@favorite_post_comment), notice: 'コメントのステータスを更新しました。'
  end
end
