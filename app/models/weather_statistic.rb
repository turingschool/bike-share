class WeatherStatistic < ActiveRecord::Base
  belongs_to :date_ref
  belongs_to :city

  def self.key_zip_to_city
    {
      '94107'=> 'San Francisco',
      '94063'=> 'Redwood City',
      '94301'=> 'Palo Alto',
      '94041'=> 'Mountain View',
      '95113'=> 'San Jose'
    }

  end

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
                            city_id: params[:weather][:city_id]
                          )
  end

  def self.udpate_record(params)
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
                  city_id: params[:weather][:city_id]
                )

  end

end
