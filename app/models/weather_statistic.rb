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
    breakout_avg_max_min_rides_days_high_temp: ""
    }

  end

end
