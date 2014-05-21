class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :email
      t.string :password
    end
  end
end
