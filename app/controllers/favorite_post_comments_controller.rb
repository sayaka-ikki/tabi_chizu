class FavoritePostCommentsController < ApplicationController
  def create
    favorite_post = FavoritePost.find(params[:favorite_post_id])
    comment = current_user.favorite_post_comments.new(favorite_post_comment_params)
    comment.favorite_post_id = favorite_post.id
    if comment.save
      redirect_to favorite_post_path(favorite_post), notice: 'コメントが追加されました。'
    else
      redirect_to favorite_post_path(favorite_post), alert: 'コメントの追加に失敗しました。'
    end
  end

  def destroy
    FavoritePostComment.find(params[:id]).destroy
    redirect_to favorite_post_path(params[:favorite_post_id])
  end

  private

  def favorite_post_comment_params
    params.require(:favorite_post_comment).permit(:favorite_post_comment_body)
  end
end
