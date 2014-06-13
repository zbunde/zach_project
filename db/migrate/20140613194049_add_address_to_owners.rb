class AddAddressToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :address, :string
  end
end
