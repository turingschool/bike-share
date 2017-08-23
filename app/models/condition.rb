require 'pry'
class Condition < ActiveRecord::Base
  has_many :trips
  validates :date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation, presence: true

  def self.sort_temp_max(range)
    amount = []
    where(max_temperature: range).each do |condition|
      amount << condition.trips
    end
    amount.size
  end

  def self.sort_temp_min(range)
    amount = []
    where(min_temperature: range).each do |condition|
      amount << condition.trips
    end
    amount.size
  end

  def self.sort_temp_mean(range)
    amount = []
    where(mean_temperature: range).each do |condition|
      amount << condition.trips
    end
    amount.size
  end

  def self.sort_wind_max(range)
    amount = []
    where(mean_wind_speed: range).each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_wind_min(range)
    amount = []
    where(mean_wind_speed: range).order('mean_wind_speed ASC').each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_wind_mean(range)
    amount = 0
    length = where(mean_wind_speed: range).count
    where(mean_wind_speed: range).each do |condition|
      condition.trips.each do |trip|
        amount += 1 if trip.start_date == condition.date
      end
    end
    amount / length
  end

  def self.sort_precip_max(range)
    amount = []
    where(precipitation: range).each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_precip_min(range)
    amount = []
    where(precipitation: range).each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_precip_mean(range)
    amount = 0
    length = where(precipitation: range).count
    where(precipitation: range).each do |condition|
      condition.trips.each do |trip|
        amount += 1 if trip.start_date == condition.date
      end
    end
    amount / length
  end

  # def self.sort_sight_max(range)
  #   dates = []
  #   where(mean_visibility: range).each do |condition|
  #     dates << condition.date
  #   end
  #   nums = []
  #   dates.each do |date|
  #     nums << Trip.where(start_date: date).count
  #   end
  #   nums.sort.last
  # end

  # def self.sort_sight_min(range)
    
  # end

  # def self.sort_sight_mean(range)
    
  # end

  # def self.sort_sight(range)
  #   array = Condition.where(mean_visibility: range).all.map {|condition| condition.date}
  #   trip_nums = array.map do |date|
  #     Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
  #   end
  #   output = {}
  #   output[:max] = trip_nums.sort.last
  #   output[:min] = trip_nums.sort.first
  #   output[:avg] = trip_nums.inject(:+) / trip_nums.length unless trip_nums.length == 0
  #   output
  # end

  # Show Methods
  def self.condition_on_day_with_highest_rides
    day_with_highest_rides = Trip.date_with_highest_number_of_trips
    Condition.find_by(date: day_with_highest_rides)
  end

  def self.condition_on_day_with_lowest_rides
    day_with_lowest_rides = Trip.date_with_lowest_number_of_trips
    Condition.find_by(date: day_with_lowest_rides)
  end
end


