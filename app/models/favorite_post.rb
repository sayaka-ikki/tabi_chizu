class FavoritePost < ApplicationRecord
  belongs_to :user

  has_one_attached :favorite_post_image

    def get_favorite_post_image(width, height)
      unless favorite_post_image.attached?
        file_path = Rails.root.join('app/assets/images/post_no_image.jpg')
        favorite_post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      favorite_post_image.variant(resize_to_limit: [width, height]).processed
    end

end
