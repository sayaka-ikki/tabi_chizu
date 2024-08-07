class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @users = User.all
    @favorite_post_comments = FavoritePostComment.all
  end
end
