class FavoritePost < ApplicationRecord
  belongs_to :user

  has_one_attached :favorite_post_image
  has_many :favorite_post_comments, dependent: :destroy

  enum category: { food: 0, sightseeing: 1, facility: 2, nature: 3, others: 4 }

  def get_favorite_post_image(width, height)
    unless favorite_post_image.attached?
      file_path = Rails.root.join('app/assets/images/post_no_image.jpg')
      favorite_post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    favorite_post_image.variant(resize_to_limit: [width, height]).processed
  end

# 検索方法の分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @favorite_post = FavoritePost.where("spot_name LIKE?","#{word}")
    elsif search == "forward_match"
      @favorite_post = FavoritePost.where("spot_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @favorite_post = FavoritePost.where("spot_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @favorite_post = FavoritePost.where("spot_name LIKE?","%#{word}%")
    else
      @favorite_post = FavoritePost.all
    end
  end

end
