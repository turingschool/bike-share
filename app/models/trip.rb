class Trip < ActiveRecord::Base
 belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
 belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

 belongs_to :bike
 belongs_to :zip_code
 belongs_to :subscription_type
 
 belongs_to :condition

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
  
  def self.trip_quantities
    date = Trip.all.map {|trip| trip.start_date.to_date}
    date.reduce(Hash.new(0)) {|h, date| h[date] += 1; h}
  end
  
  def self.date_with_most_trips
    Trip.trip_quantities.max_by {|key, value| value}.first
  end
  
  def self.date_with_least_trips
    Trip.trip_quantities.min_by {|key, value| value}.first
  end
  
  def self.total_rides_per_month
    ride_years = Trip.all.reduce(Hash.new(0)) do |hash, trip|
      hash[trip.start_date.year] = Hash.new(0)
      hash
    end
    
    Trip.all.each do |trip|
      ride_years[trip.start_date.year][trip.start_date.month] += 1
    end
    ride_years
  end

end
