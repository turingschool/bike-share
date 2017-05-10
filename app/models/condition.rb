require 'pry'
class Condition < ActiveRecord::Base
  belongs_to :zipcode

  validates :date, presence:true
  validates :max_temp, presence:true
  validates :mean_temp, presence:true
  validates :min_temp, presence:true
  validates :mean_humidity, presence:true
  validates :mean_visibility, presence:true
  validates :mean_wind_speed, presence:true
  validates :precipitation, presence:true

  def format_date
    date.strftime('%m/%d/%Y')
  end

  def zipcode_selected(id)
    return "selected" if id == zipcode_id
    ""
  end

  def self.all_pages
    (Condition.count / 30.0).ceil
  end

  def self.paginate(page)
    offset = ( page - 1 ) * 30
    Condition.limit(30).offset(offset)
  end

  def self.determine_temp_range_dates(low, high)
    where("mean_temp >= #{low} and mean_temp < #{high}").select(:date)
  end

  def self.determine_ave_rides_per_day_in_temp_range(low, high)
    x = determine_temp_range_dates(low,high)
    y = Trip.determine_trips_on_specific_dates(x)
    y.count/x.count
  end

  def self.get_mean_temp_intervals
    temps = group('CAST(mean_temp AS int)/10*10 || \'-\' || CAST(mean_temp AS int)/10*10+9').count(:mean_temp)
    temps.keys.sort.reverse
  end
end
