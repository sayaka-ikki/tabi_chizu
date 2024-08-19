class AddColumnAddressToSchedulePosts < ActiveRecord::Migration[6.1]
  def change
    add_column :schedule_posts, :address, :string
  end
end
