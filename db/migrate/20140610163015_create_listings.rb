class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.string :owner_name
      t.string :seller_id

    end
  end
end
