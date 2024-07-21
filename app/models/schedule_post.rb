class SchedulePost < ApplicationRecord
  belongs_to :user
  has_many :trip_itineraries, dependent: :destroy

  has_one_attached :schedule_post_image

    def get_schedule_post_image(width, height)
      unless schedule_post_image.attached?
        file_path = Rails.root.join('app/assets/images/post_no_image.jpg')
        schedule_post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      schedule_post_image.variant(resize_to_limit: [width, height]).processed
    end

end
