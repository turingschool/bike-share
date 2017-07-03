class Trip < ActiveRecord::Base
  belongs_to :station
  belongs_to :station_name
  belongs_to :subscription_type
  belongs_to :zip_code
  belongs_to :bike_share_date
end

def id
  Trip.find(id)[:id]
end

def start_date
  Trip.find(id)[:bike_share_date]
end

#maybe Trip works too?
def start_station
  Station.find(id)[:name]
end

def end_date
  Trip.find(id)[:bike_share_date]
end

def end_station
  Station.find(id)[:name]
end

def bike_id
  Trip.find(id)[:bike_id]
end

def zip_code
  Trip.find(id)[:zip_code]
end
