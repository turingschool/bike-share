class City < ActiveRecord::Base
  validates_presence_of :city
  has_many :stations
end
