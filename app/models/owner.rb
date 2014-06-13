class Owner < ActiveRecord::Base
  belongs_to :company
  has_secure_password
end