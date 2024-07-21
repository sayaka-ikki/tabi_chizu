class AddNameToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :trip_itineraries, :schedule_post_id, :integer
  end
end
