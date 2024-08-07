class FavoritePostComment < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_post

  scope :active, -> { where(status: true) }
end
