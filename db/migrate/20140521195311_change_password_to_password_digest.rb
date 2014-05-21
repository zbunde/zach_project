class ChangePasswordToPasswordDigest < ActiveRecord::Migration
    def change
      rename_column :sellers, :password, :password_digest
    end
  end

