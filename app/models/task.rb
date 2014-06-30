class Task < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  belongs_to :listing



end