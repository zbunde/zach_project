class AddSellerEmailToListing < ActiveRecord::Migration
  def change
    add_column :listings, :seller_email, :string

  end
end
