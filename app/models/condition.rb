class Condition < ActiveRecord::Base
   acts_as_copy_target #for postgres copy

    has_many :trips, class_name: "Trip", foreign_key: "start_date",
         primary_key: "date"

ZIP_CODE = 95113

#just choosing one zip in conditions for all analytics

    def self.avg_rides_by_weather(start_of_range)
      conditions = Condition.where(max_temperature:                      #gives us conditions in temp tange
                                   start_of_range..(start_of_range+9))
      dates_in_temp_range = conditions.select(:date).distinct.where(     #dates_for_zipcode_in_temp_range
                            zip_code: ZIP_CODE)
      total_trips = Trip.where(start_date: dates_in_temp_range)          #takes A COLLECTION of dates as an argument to give us all the trips
                                                                         #for the dates in temp range
      total_trips.count / dates_in_temp_range.count
    end

    def self.high_rides_by_weather(start_of_range)
      conditions = Condition.where(max_temperature:
                                   start_of_range..(start_of_range+9))
      dates_in_temp_range = conditions.select(:date).distinct.where(
                            zip_code: ZIP_CODE)
      total_trips = Trip.where(start_date: dates_in_temp_range)
      total_trips.group(:start_date).order('count_id DESC').count(:id).keys.first
    end

    def self.high_rides_by_weather(start_of_range)
      conditions = Condition.where(max_temperature:
                                   start_of_range..(start_of_range+9))
      dates_in_temp_range = conditions.select(:date).distinct.where(
                            zip_code: ZIP_CODE)
      total_trips = Trip.where(start_date: dates_in_temp_range)
      total_trips.group(:start_date).order('count_id DESC').count(:id).keys.last
    end
end
