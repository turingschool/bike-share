class City < ActiveRecord::Base
  has_many :stations
end
#I don't think this method is correct, needs to be City.find(id).name
def name
  City.find(id)[:name]
end
