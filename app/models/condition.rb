class Condition < ActiveRecord::Base
  belongs_to :start_date, class_name: "Trip", foreign_key: "date"

  # validates_presence_of :date,
  #                       :max_temperature,
  #                       :mean_temperature,
  #                       :min_temperature,
  #                       :mean_humidity,
  #                       :mean_visibility,
  #                       :mean_wind_speed,
  #                       :precipitation

end
