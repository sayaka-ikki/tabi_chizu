class RemoveScheduleIdFromTripItineraries < ActiveRecord::Migration[6.1]
  def change
    remove_column :trip_itineraries, :schedule_id, :integer
  end
end
