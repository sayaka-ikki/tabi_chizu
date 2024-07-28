class SchedulePostsController < ApplicationController
  def new
    @schedule_post = SchedulePost.new
    @schedule_post.trip_itineraries.build
  end

  def create
    @schedule_post = SchedulePost.new(schedule_post_params)
    @schedule_post.user_id = current_user.id
    @schedule_post.save
    redirect_to schedule_post_path(@schedule_post.id)
  end

  def index
    @schedule_posts = SchedulePost.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @schedule_post = SchedulePost.find(params[:id])
    @trip_itineraries = @schedule_post.trip_itineraries
  end

  def edit
     @schedule_post = SchedulePost.find(params[:id])
     @trip_itineraries = @schedule_post.trip_itineraries
  end

  def update
    @schedule_post = SchedulePost.find(params[:id])
    if @schedule_post.update(schedule_post_params)
      flash[:notice] = "スケジュールの編集が完了しました！"
      redirect_to schedule_post_path(@schedule_post.id)
    end
  end

  def destroy
    @schedule_post = SchedulePost.find(params[:id])
    if @schedule_post.destroy
      flash[:notice] = "スケジュール投稿を削除しました。"
      redirect_to schedule_posts_path
    end
  end

  private

  def schedule_post_params
    params.require(:schedule_post).permit(:trip_title, :latitude, :longitude, :inventory_list, :schedule_post_image, trip_itineraries_attributes: [:spot_name,:date_time,:body])
  end

end
