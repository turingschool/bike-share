class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :bike_share_date
  belongs_to :station_name
  has_many   :trips
  validates  :station_name_id, presence: true
  validates  :dock_count, presence: true
  validates  :city_id, presence: true
  validates  :installation_date_id, presence: true

  def self.sql(query)
    ActiveRecord::Base.connection.exec_query(query)
  end

  def self.total_station_count
    Station.all.count
    #sql("SELECT COUNT(id) FROM stations").first["count"].to_i
  end

  def name
    Station.find(id)[:name]
  end

  def self.average_bikes_per_station
    sql("SELECT AVG(dock_count)FROM stations").first["avg"].to_i
  end

  def self.most_bikes_avaiable
    sql("SELECT name FROM stations ORDER BY dock_count ASC").first["name"]
  end

  def self.stations_with_most_bikes
    sql("SELECT name FROM stations ORDER BY dock_count ASC LIMIT 5").map {|x| "#{x["name"]}"}
  end

  def self.fewest_bikes_avaiable
    sql("SELECT name FROM stations ORDER BY dock_count DESC").first["name"]
  end

  def self.stations_with_fewest_bikes
    sql("SELECT name FROM stations ORDER BY dock_count DESC LIMIT 5").map {|x| "#{x["name"]}"}
  end

  def self.most_recent_station
    sql("SELECT name FROM stations ORDER BY installation_date ASC").first["name"]
  end

  def self.oldest_station
    sql("SELECT name FROM stations ORDER BY installation_date DESC").first["name"]
  end

#this works even without the method below!?!!?
  def installation_date
    Station.find(id)[:installation_date]
  #BikeShareDate.find(installation_date_id)
  end
end
