class Trip < ActiveRecord::Base
    has_many :zipcodes
    has_many :stations
end
