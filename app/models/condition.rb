require 'pry'
require'./app/models/condition-dashboard/ranges'
require'./app/models/condition-dashboard/relations'
require'./app/models/condition-dashboard/averages'
require'./app/models/condition-dashboard/highest'
require'./app/models/condition-dashboard/lowest'


class Condition < ActiveRecord::Base
extend Ranges
extend Relations
extend Averages
extend Highest
extend Lowest

has_many :trips, foreign_key: "start_date", primary_key: "date"





def self.weather_on_days_with_highest_number_of_rides
   high_dates = Trip.group(:start_date).order("count_id DESC").count(:id)
   Condition.where(:date => high_dates.keys.first)
end

def self.weather_on_days_with_lowest_number_of_rides
   high_dates = Trip.group(:start_date).order("count_id DESC").count(:id)
   Condition.where(:date => high_dates.keys.last)
end

   # validates_presence_of :max_temperature_f,
   #                        :mean_temperature_f,
   #                        :min_temperature_f,
   #                        :mean_wind_speed_mph,
   #                        :mean_visibility_miles,
   #                        :mean_wind_speed_mph,
   #                        :precipitation_inchesend
  # extend Ranges
end
