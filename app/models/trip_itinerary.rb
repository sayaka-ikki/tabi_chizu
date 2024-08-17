class TripItinerary < ApplicationRecord
  belongs_to :schedule_post

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end