class FavoritePost < ApplicationRecord
  belongs_to :user

  has_one_attached :favorite_post_image

  def get_image
    unless favorite_post_image.attached?
      file_path = Rails.root.join('app/assets/images/post_no_image.jpg')
      favorite_post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      favorite_post_image
  end

end
