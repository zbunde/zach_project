class AddListingToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :listing_id, :integer
    add_column :tasks, :seller_id, :integer
  end
end
