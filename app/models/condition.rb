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

  def self.determine_date_range(column, low, high)
    where("#{column} >= #{low} and #{column} < #{high}").select(:date)
  end

  def self.ave_rides_per_condition(column, low, high)
    x = determine_date_range(column,low,high)
    y = Trip.determine_trips_on_specific_dates(x)
    return 0 if x == 0
    (y.count.to_f/x.count.to_f).round(2)
  end

  def self.most_rides_per_condition(column, low, high)
    x = determine_date_range(column, low, high)
    y = Trip.determine_trips_on_specific_dates(x)
    return 0 if y.empty?
    y.group(:start_date).count.max_by{|start_date, count| count}[1]
  end

  def self.fewest_rides_per_condition(column, low, high)
    x = determine_date_range(column, low, high)
    y = Trip.determine_trips_on_specific_dates(x)
    return 0 if y.empty?
    y.group(:start_date).count.min_by{|start_date, count| count}[1]
  end

  def self.get_intervals_10(measure)
    temps = group('CAST( '+measure+' AS int)/10*10 || \' \' || CAST( '+measure+' AS int)/10*10+9').count(measure)
    temps.keys.sort.reverse.map(&:split)
  end

  def self.get_intervals_4(measure)
    measures = select(measure)
    intervals = measures.reduce({}) do |ints, record|
      intervals = convert_to_4_interval(record.send(measure.to_sym))
      ints[intervals] = (ints[intervals] || 0) + 1
      ints
    end
    intervals.keys.sort.reverse
  end

  def self.convert_to_4_interval(measure)
    lower = reduce_to_modulo(measure, 4)
    upper = increase_to_modulo(measure, 4) - 1
    [lower.to_i, upper.to_i]
  end

  def self.reduce_to_modulo(start, mod)
    until start % mod == 0
      start -= 1
    end
    start
  end

  def self.increase_to_modulo(start, mod)
    start += 1 if start % mod == 0
    until start % mod == 0
      start += 1
    end
    start
  end

  def self.get_intervals_0_50(measure)
    measures = select(measure)
    intervals = measures.reduce({}) do |ints, record|
      intervals = convert_to_0_50_interval(record.send(measure.to_sym))
      ints[intervals] = (ints[intervals] || 0) + 1
      ints
    end
    intervals.keys.sort.reverse
  end

  def self.convert_to_0_50_interval(measure)
    lower = (measure*2).floor / 2.0
    upper = ( (measure*2).ceil / 2.0 ) - 0.01
    upper = 0.49 if upper < 0
    [lower.to_s.ljust(4,"0"), upper.to_s.ljust(4,"0")]
  end
end
