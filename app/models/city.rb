class City < ActiveRecord::Base
  has_many :stations
  has_many :conditions
  validates :name, presence: true
end
