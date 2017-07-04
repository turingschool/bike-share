class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :bike_share_date
  belongs_to :station_name
  has_many   :trips
  validates  :station_name_id, presence: true
  validates  :dock_count, presence: true
  validates  :city_id, presence: true
  validates  :installation_date_id, presence: true


  def installation_date
    BikeShareDate.find(installation_date_id)
  end


def name
   StationName.find(station_name_id).name
end

def city
    City.find(city_id).name
  end

  def self.sql(query)
    ActiveRecord::Base.connection.exec_query(query)
  end

  def self.total_station_count
    #Station.all.count
    sql("SELECT COUNT(id) FROM stations").first["count"].to_i
  end

  def self.average_bikes_per_station
    sql("SELECT AVG(dock_count)FROM stations").first["avg"].to_i
    #Station.average(:dock_count)
  end

  def self.most_bikes_available
    sql("SELECT station_name_id FROM stations ORDER BY dock_count ASC").first["name"]
    #Station.order(:dock_count).first
  end

  def self.stations_with_most_bikes
    sql("SELECT station_name_id FROM stations ORDER BY dock_count ASC LIMIT 5").map {|x| "#{x["name"]}"}
    #Station.order(dock_count: :asc).limit(5)
  end

  def self.fewest_bikes_avaiable
    sql("SELECT station_name_id FROM stations ORDER BY dock_count DESC").first["name"]
    #Station.order(:dock_count).last
  end

  def self.stations_with_fewest_bikes
    sql("SELECT station_name_id FROM stations ORDER BY dock_count DESC LIMIT 5").map {|x| "#{x["name"]}"}
    #Station.order(dock_count: :desc).limit(5)
  end

  def self.most_recent_station
    sql("SELECT station_name_id FROM stations ORDER BY installation_date_id ASC").first["name"]
    #Station.order(:installation_date).first
  end

  def self.oldest_station
    sql("SELECT station_name_id FROM stations ORDER BY installation_date_id DESC").first["name"]
    #Station.order(:installation_date).last
  end
end
