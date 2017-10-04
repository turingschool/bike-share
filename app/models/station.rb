class Station < ActiveRecord::Base
  has_many :trips_started, class_name: "Trip", foreign_key: :start_station_id
  has_many :trips_ended, class_name: "Trip", foreign_key: :end_station_id  

  validates_presence_of :name,
                        :dock_count,
                        :city,
                        :installation_date,
                        :lat,
                        :long

end