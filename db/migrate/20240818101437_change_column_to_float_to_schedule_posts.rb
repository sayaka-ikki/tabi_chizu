class ChangeColumnToFloatToSchedulePosts < ActiveRecord::Migration[6.1]
  def change
    change_column :schedule_posts, :latitude, :float
    change_column :schedule_posts, :longitude, :float
  end
end
