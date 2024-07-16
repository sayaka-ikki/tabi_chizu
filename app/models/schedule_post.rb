class SchedulePost < ApplicationRecord
  belongs_to :user
  has_many :trip_itineraries, dependent: :destroy

  has_one_attached :schedule_post_image
end
