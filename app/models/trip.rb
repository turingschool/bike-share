class Trip < ActiveRecord::Base
 belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
 belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id

 belongs_to :bike
 belongs_to :zip_code
 belongs_to :subscription_type
 
 belongs_to :condition

 validates :duration, presence: true # , uniqueness: true
 validates :start_date, presence: true
 validates :start_station_id, presence: true
 validates :end_date, presence: true
 validates :end_station_id, presence: true
 validates :bike_id, presence: true
 validates :subscription_type_id, presence: true

 def self.create_trip(params)
   Trip.create(
     duration:             params[:trip][:duration],
     start_date:           params[:trip][:start_date],
     start_station_id:     params[:trip][:start_station],
     end_date:             params[:trip][:end_date],
     end_station_id:       params[:trip][:end_station],
     subscription_type_id: params[:trip][:subscription_type],
     zip_code:             ZipCode.find_or_create_by(zip_code: params[:trip][:zip_code]),
     bike:                 Bike.find_by(bike_number: params[:trip][:bike_number])
   )
 end

 def self.update_trip(params)
   Trip.find(params[:id]).update(
     duration:             params[:trip][:duration],
     start_date:           params[:trip][:start_date],
     start_station_id:     params[:trip][:start_station],
     end_date:             params[:trip][:end_date],
     end_station_id:       params[:trip][:end_station],
     subscription_type_id: params[:trip][:subscription_type],
     zip_code:             ZipCode.find_or_create_by(zip_code: params[:trip][:zip_code]),
     bike:                 Bike.find_by(bike_number: params[:trip][:bike_number])
   )
 end

end
