class CreateFavoritePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_post_comments do |t|
      t.integer :user_id
      t.text :favorite_post_comment_body
      t.integer :favorite_post_id

      t.timestamps
    end
  end
end
