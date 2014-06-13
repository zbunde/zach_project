class Company < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, :uniqueness => true
  has_many :owners

end