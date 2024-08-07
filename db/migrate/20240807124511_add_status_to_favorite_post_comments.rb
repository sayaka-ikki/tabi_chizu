class AddStatusToFavoritePostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :favorite_post_comments, :status, :boolean, default: true
  end
end
