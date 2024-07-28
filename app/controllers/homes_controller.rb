class HomesController < ApplicationController
  def top
    @schedule_posts = SchedulePost.order(created_at: :desc).limit(3)
    @favorite_posts = FavoritePost.order(created_at: :desc).limit(3)
  end


end
