class CreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.date     :date
      t.float    :max_temperature
      t.float    :mean_temperature
      t.float    :min_temperature
      t.float    :mean_humidity
      t.float    :mean_visibility
      t.float    :mean_wind_speed
      t.float    :percipitation
  end
end
