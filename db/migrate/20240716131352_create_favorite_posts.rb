class CreateFavoritePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_posts do |t|

      t.integer :user_id
      t.string :spot_name
      t.string :category
      t.text :body

      t.timestamps
    end
  end
end
