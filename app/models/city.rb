class City < ActiveRecord::Base
  has_many :stations
end

def name
  City.find(id)[:name]
end
