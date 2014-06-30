class Owner < ActiveRecord::Base
  validates :password_digest, length: { minimum: 8 }

  belongs_to :company
  has_secure_password

end