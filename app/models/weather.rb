# Date
# Max Temperature
# Mean Temperature
# Min Temperature
# Mean Humidity
# Mean Visibility (in Miles)
# Mean Wind Speed (mph)
# Precipitation (inches)


class Weather < ActiveRecord::Base

	validates :date, uniqueness: true

	def self.total
		all.count
	end


	def self.avg_rides

		Weather.find()
		# self.where(max_temperature --put range)

	end

	def self.highest_rides

	end

	def self.lowest_rides

	end



      # Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)

  def self.temp_breakdown
    # find trips per day

    #30-100
    (30..100).step(10) do |num|
      puts "For temps #{num..(num+10)}"

      #array of the dates for that temp range
      dates =  Weather.where(max_temperature: num..num+10).pluck(:date)
      dates.map! { |date| date.to_time.in_time_zone('UTC') }


      # sum of trips for each day
      trips = Hash.new(0)
      dates.map do |date|
        trips[date] = Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
      end

      #refactor this
      if trips.values.inject(:+).nil?
        average = 0
      else
        average = trips.values.inject(:+) / trips.count
      end

      #find and print variables of interest
      highest = trips.max_by {|_,v| v}
      lowest = trips.min_by {|_,v| v}

      puts "average: #{average}"
      puts "highest: #{highest[1]}" unless highest.nil?
      puts "lowest: #{lowest[1]}" unless lowest.nil?
    end


    # trips counted by date

    # trips = Trip.group("DATE_TRUNC('day', start_date)").count
    #trips = Trip.where("DATE(start_date: ? )", dates)???
    # trips = Trip.group("DATE(start_date) = 2013-08-29 09:08:00 UTC")???

    #Put values into hash for easy return?
  end

  def ride_counts
  end


end
