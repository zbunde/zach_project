class Listing < ActiveRecord::Base
    validates :address, :presence => true
    validates :owner_name, :presence => true
    validates :owner_email, :presence => true
    has_many :tasks

end