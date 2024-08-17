class ChangeLatitudeAndLongitudeToAddressInTripItineraries < ActiveRecord::Migration[6.0]
  def change
    remove_column :trip_itineraries, :latitude, :integer
    remove_column :trip_itineraries, :longitude, :integer
    add_column :trip_itineraries, :address, :string
  end
end