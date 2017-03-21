class Trip < ActiveRecord::Base
 belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
 belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

 belongs_to :bike
 belongs_to :zip_code
 belongs_to :subscription_type

 validates :duration, presence: true
 validates :start_date, presence: true
 validates :start_station_id, presence: true
 validates :end_date, presence: true
 validates :end_station_id, presence: true
 validates :bike_id, presence: true
 validates :subscription_type_id, presence: true

 def self.create_trip(params)
   Trip.create!(
     duration:             (Time.parse(params[:trip][:end_date]) - Time.parse(params[:trip][:start_date])).to_i,
     start_date:           params[:trip][:start_date],
     start_station_id:     params[:trip][:start_station],
     end_date:             params[:trip][:end_date],
     end_station_id:       params[:trip][:end_station],
     subscription_type_id: params[:trip][:subscription_type],
     zip_code:             ZipCode.find_or_create_by(zip_code: params[:trip][:zip_code]),
     bike:                 Bike.find_or_create_by(bike_number: params[:trip][:bike_number])
   )
 end

 def self.update_trip(params)
   Trip.find(params[:id]).update(
     duration:             (Time.parse(params[:trip][:end_date]) - Time.parse(params[:trip][:start_date])).to_i,
     start_date:           params[:trip][:start_date],
     start_station_id:     params[:trip][:start_station],
     end_date:             params[:trip][:end_date],
     end_station_id:       params[:trip][:end_station],
     subscription_type_id: params[:trip][:subscription_type],
     zip_code:             ZipCode.find_or_create_by(zip_code: params[:trip][:zip_code]),
     bike:                 Bike.find_or_create_by(bike_number: params[:trip][:bike_number])
   )
 end
 
 def self.average_duration
   Trip.average(:duration).to_i
 end
 
 def self.longest_ride
   Trip.maximum(:duration).to_i
 end
 
 def self.shortest_ride
   Trip.minimum(:duration).to_i
 end
 
 def self.date_with_most_trips
  #  Trip.order(start_date: :desc).first
 end

 # def self.list_maker(trip_list)
 #   if trip_list.count == 0
 #     "No Stations Available"
 #   elsif trip_list.count == 1
 #     trip_list.first.start_station_id
 #   else
 #     output = trip_list.reduce("") do |sum, trip|
 #         sum + trip.start_station_id + ", "
 #     end
 #     output[0..-3]
 #   end
 # end
 # 
 # def self.start_station_with_most_rides
 #   list_maker(Trip.where(start_station_id: 1))
 # end
 # 
 # def self.rides_per_start_station
 #   Trip.start_stations.count(:start_station_id)
 # end
 
 # def self.total_rides_per_month
 #   
 # end


end
