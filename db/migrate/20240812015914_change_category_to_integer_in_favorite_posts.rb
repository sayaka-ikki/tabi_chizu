class ChangeCategoryToIntegerInFavoritePosts < ActiveRecord::Migration[6.1]
  def change
    change_column :favorite_posts, :category, :integer, default: 0
  end
end
