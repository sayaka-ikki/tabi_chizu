class FavoritePostComment < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_post
end
