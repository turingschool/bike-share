class WeatherStatistic < ActiveRecord::Base
  belongs_to :date_ref
  belongs_to :zipcode
end
