class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :email
      t.string :name
      t.string :password_reset_token


    end
  end
end
