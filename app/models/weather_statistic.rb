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
    date = DateRef.find_or_create_by(date: params[:weather][:date_ref_id])
    WeatherStatistic.create(max_temperature: params[:weather][:max_temperature],
                            min_temperature: params[:weather][:min_temperature],
                            mean_temperature: params[:weather][:mean_temperature],
                            mean_visibility: params[:weather][:mean_visibility],
                            mean_humidity: params[:weather][:mean_humidity],
                            mean_wind_speed: params[:weather][:mean_wind_speed],
                            precipitation: params[:weather][:precipitation],
                            date_ref_id: date.id,
                          )
  end

  def self.update_record(params)
    date = DateRef.find_or_create_by(date: params[:weather][:date_ref_id])
    WeatherStatistic.update(params[:id],
                  max_temperature: params[:weather][:max_temperature],
                  min_temperature: params[:weather][:min_temperature],
                  mean_temperature: params[:weather][:mean_temperature],
                  mean_visibility: params[:weather][:mean_visibility],
                  mean_humidity: params[:weather][:mean_humidity],
                  mean_wind_speed: params[:weather][:mean_wind_speed],
                  precipitation: params[:weather][:precipitation],
                  date_ref_id: date.id,
                )

  end

  def self.dashboard
    { 
    breakout_avg_max_min_rides_days_high_temp: WeatherStatistic.high_temp,
    breakout_avg_max_min_rides_days_precipitation: WeatherStatistic.precipitation,
    breakout_avg_max_min_rides_days_wind_speed: WeatherStatistic.mean_wind_speed,
    breakout_avg_max_min_rides_days_visibility: WeatherStatistic.mean_visibility
    }

  end

  def self.high_temp
    range = range_high_temp
    stat = trips_by_weather(range, 10, "max_temperature")
    format(stat).reduce Hash.new, :merge
  end

  def self.precipitation
    range = range_precipitation
    stat = trips_by_weather(range, 0.5, "precipitation")
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

  def self.range_precipitation
    ((WeatherStatistic.minimum(:precipitation).floor)..(WeatherStatistic.maximum(:precipitation).ceil)).step(0.5).to_a
  end

  def self.range_high_temp
    (((WeatherStatistic.minimum(:max_temperature)/10).floor*10)..((WeatherStatistic.maximum(:max_temperature)/10).ceil * 10)).step(10).to_a
  end

  # def self.range_high_temp(tag, div, inc)
  #   (((WeatherStatistic.minimum(tag)/div).floor*div)..((WeatherStatistic.maximum(tag)/div).ceil * div)).step(div).to_a
  # end

  def self.trips_by_weather(range, increment, statistic)
    range.each_with_index.map do |stat, index|
      if index == 0
        next
      else
        {"#{stat-increment} - #{stat}" => 
          WeatherStatistic.joins(:trips)
                    .where("#{statistic} between ? and ?", range[index-1], range[index])
                    .group(:date)
                    .order('count_id ASC')
                    .count(:id).values
          
        }
      end
    end.compact
  end

  def self.format(hash)
    hash.map do |ranges| 
      ranges.each do |k, v| 
        if v.empty? 
          ranges[k] = [0, 0, 0] 
        else 
          ranges[k] = [v.max, v.min, (v.inject(:+)/v.length)] 
        end 
      end 
    end
  end
end