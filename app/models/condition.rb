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

  def zipcode_selected?(id)
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

  def self.determine_date_range(column, low, high)
    where("#{column} >= #{low} and #{column} < #{high}").select(:date)
  end

  def self.ave_rides_per_condition(column, low, high)
    x = determine_date_range(column,low,high)
    y = Trip.determine_trips_on_specific_dates(x)
    (y.count.to_f/x.count.to_f).round(2)
  end

  def self.most_rides_per_condition(column, low, high)
    x = determine_date_range(column, low, high)
    y = Trip.determine_trips_on_specific_dates(x)
    y.group(:start_date).count.max_by{|start_date, count| count}[1]
  end

  def self.fewest_rides_per_condition(column, low, high)
    x = determine_date_range(column, low, high)
    y = Trip.determine_trips_on_specific_dates(x)
    y.group(:start_date).count.min_by{|start_date, count| count}[1]
  end

  def self.get_intervals(measure)
    temps = group('CAST( '+measure+' AS int)/10*10 || \' \' || CAST( '+measure+' AS int)/10*10+9').count(measure)
    temps.keys.sort.reverse.map(&:split)
  end
end
