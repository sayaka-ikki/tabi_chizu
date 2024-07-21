class CreateTripItineraries < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_itineraries do |t|

      t.integer :schedule_post_id, foreign_key: true
      t.string :spot_name
      t.datetime :date_time
      t.text :body
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
