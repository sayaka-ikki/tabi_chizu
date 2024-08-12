class ChangeDefaultCategoryToOthersInFavoritePosts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :favorite_posts, :category, from: 0, to: 4
  end
end
