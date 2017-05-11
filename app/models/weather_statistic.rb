class WeatherStatistic < ActiveRecord::Base
  belongs_to :date_ref
  belongs_to :city

  has_many :trips, through: :date_ref

  validates :max_temperature, presence: true
  validates :mean_temperature, presence: true
  validates :min_temperature, presence: true
  validates :mean_visibility, presence: true
  validates :mean_humidity, presence: true
  validates :mean_wind_speed, presence: true
  validates :precipitation, presence: true
  validates :date_ref_id, presence: true

  def self.create_new(params)
    date = WeatherStatistic.validate_date(params[:weather][:date_ref_id])
    ws = WeatherStatistic.create(max_temperature: params[:weather][:max_temperature],
                            min_temperature: params[:weather][:max_temperature],
                            mean_temperature: params[:weather][:max_temperature],
                            mean_visibility: params[:weather][:max_temperature],
                            mean_humidity: params[:weather][:max_temperature],
                            mean_wind_speed: params[:weather][:max_temperature],
                            precipitation: params[:weather][:precipitation],
                            date_ref_id: date,
                          )
    [ws.save, ws]
  end

  def self.update_record(params)
    date = WeatherStatistic.validate_date(params[:weather][:date_ref_id])
    ws = WeatherStatistic.find(params[:id])
    status = ws.update(
                  max_temperature: params[:weather][:max_temperature],
                  min_temperature: params[:weather][:min_temperature],
                  mean_temperature: params[:weather][:mean_temperature],
                  mean_visibility: params[:weather][:mean_visibility],
                  mean_humidity: params[:weather][:mean_humidity],
                  mean_wind_speed: params[:weather][:mean_wind_speed],
                  precipitation: params[:weather][:precipitation],
                  date_ref_id: date,
                )
      [status, ws]
  end

  def self.dashboard
    { 
    breakout_avg_max_min_rides_days_high_temp: WeatherStatistic.breakout_alt(:max_temperature, 10, 10),
    breakout_avg_max_min_rides_days_precipitation: WeatherStatistic.breakout_alt(:precipitation, 1, 0.5),
    breakout_avg_max_min_rides_days_wind_speed: WeatherStatistic.mean_wind_speed,
    breakout_avg_max_min_rides_days_visibility: WeatherStatistic.mean_visibility
    }
  end


  def self.breakout_alt(column, div, inc)
    range = range_alt(column, div, inc)
    stat = trips_by_weather(range, inc, column.to_s)
    format(stat).reduce Hash.new, :merge
  end

  

  def self.mean_wind_speed
    range = range(:mean_wind_speed, 4)
    stat = trips_by_weather(range, 4, "mean_wind_speed")
    format(stat).reduce Hash.new, :merge
  end

  def self.mean_visibility
    range = range(:mean_visibility, 4)
    stat = trips_by_weather(range, 4.0, "mean_visibility")
    format(stat).reduce Hash.new, :merge
  end
  

  def self.range(stat, inc)
    max = WeatherStatistic.maximum(stat)
    range = (0..(max + max % 4)).step(inc).to_a
  end

  def self.range_alt(tag, div, inc)
    (((WeatherStatistic.minimum(tag)/div).floor*div)..((WeatherStatistic.maximum(tag)/div).ceil * div)).step(inc).to_a
  end

  def self.trips_by_weather(range, increment, statistic)
    range.each_with_index.map do |stat, index|
      if index == 0
        next
      else
        {"#{stat-increment} - #{stat}" => WeatherStatistic.query_weather(statistic, index, range)}
      end
    end.compact
  end

  def self.query_weather(statistic, index, range)
    WeatherStatistic.joins(:trips)
              .where("#{statistic} between ? and ?", range[index-1], range[index])
              .group(:date)
              .order('count_id ASC')
              .count(:id).values
  end

  def self.format(hash)
    hash.map do |ranges| 
      WeatherStatistic.max_min_avg(ranges)
    end
  end

  def self.max_min_avg(ranges)
    ranges.each do |k, v| 
      if v.empty? 
        ranges[k] = [0, 0, 0] 
      else 
        ranges[k] = [v.max, v.min, (v.inject(:+)/v.length)] 
      end  
    end
    ranges
  end

  def self.validate_date(date)
    if date.empty?
      ''
    else
      date = DateRef.find_or_create_by(date: date)
      date.id
    end
  end

end