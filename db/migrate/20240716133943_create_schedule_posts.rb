class CreateSchedulePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_posts do |t|

      t.integer :user_id
      t.string :trip_title
      t.integer :latitude
      t.integer :longitude
      t.text :inventory_list

      t.timestamps
    end
  end
end
