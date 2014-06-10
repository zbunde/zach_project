class RenameSellerEmailToOwnerEmail < ActiveRecord::Migration
  def change
    rename_column :listings, :seller_email, :owner_email

  end
end
