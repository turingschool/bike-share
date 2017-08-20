class Station < ActiveRecord::Base

    validates :name, presence: true
    validates :dock_count, presence: true
    validates :city, presence: true
    validates :installation_date, presence: true

    def self.average_bikes
      Station.average("dock_count").round(2)
    end

    def self.most_bikes
      Station.maximum("dock_count")
    end

    def self.station_with_most_bikes
      Station.order("dock_count").last.name
    end

    def self.fewest_bikes
      Station.minimum("dock_count")
    end

    def self.station_with_fewest_bikes
      Station.order("dock_count").first.name
    end

    def self.most_recent_station
      Station.order("installation_date").last.name
    end

    def self.oldest_station
      Station.order("installation_date").first.name
    end

end
