class Trip < ActiveRecord::Base
    belongs_to :start_station, class_name: "Station"
    belongs_to :end_station,   class_name: "Station"

    validates_presence_of :duration,
                          :start_date,
                          :start_station_id,
                          :end_date,
                          :end_station_id,
                          :bike_id,
                          :subscription_type,
                          :zip_code

  def self.average_ride_length
    where duration: (average :duration)
  end

  def self.trip_of_longest_length
    where duration: (maximum :duration)
  end

  def self.trip_of_longest_length
    where duration: (minimum :duration)
  end

  def self.starting_station_with_most_rides #THIS WORKS!!!
    var = group(:start_station_id).order(start_station_id: :desc).count(:id).first[0]
    Station.find(var).name
  end




end

=begin
User.order(:name, email: :desc)
=> SELECT "users".* FROM "users" ORDER BY "users"."name" ASC, "users"."email" DESC
 :name is the column name from the table that I want to return.
 I want to order the name column by the email address - descending email alphabetization.

Trip.order(:id, duration: :desc)
this still sorted by id in descending order. not sure what descending was doing.

User.order('name DESC, email')
=> SELECT "users".* FROM "users" ORDER BY name DESC, email

Trip.order('id DESC, duration')
returns an array based on id descending. Not sure what's up with the duration.

Station.find(group(:starting_station_id).order(:id).count(:id)).name


Station with the most rides as an ending place.
Month by Month breakdown of number of rides with subtotals for each year.
Most ridden bike with total number of rides for that bike.
Least ridden bike with total number of rides for that bike.
User subscription type breakout with both count and percentage.
Single date with the highest number of trips with a count of those trips.
Single date with the lowest number of trips with a count of those trips.

=end
