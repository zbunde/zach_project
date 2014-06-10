class ChangePasswordToPasswordDigest < ActiveRecord::Migration
    def change
      rename_column :companies, :password, :password_digest
    end
  end

