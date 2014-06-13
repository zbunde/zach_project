class AddCompanyIdToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :company_id, :integer

  end
end
