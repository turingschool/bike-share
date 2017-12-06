class Condition < ActiveRecord::Base
  has_many :trips, class_name: "Trip", foreign_key: "condition_id"


  def self.date_id(date, zipcode)
    look_up_all = where(date: date)
    select_condition = look_up_all.find_by(zip_code: zipcode)
    if select_condition
      select_condition.id
    else
      nil
    end
  end

  def self.max_weather_ride_analytics(category, min, max)
    days = where(category => (min..max))
    days.joins(:trips).group(:date).order("count_all DESC").count.first[1]
  end

  def self.min_weather_ride_analytics(category, min, max)
    days = where(category => (min..max))
    days.joins(:trips).group(:date).order("count_all").count.first[1]
  end

  def self.avg_weather_ride_analytics(category, min, max)
    days = where(category => (min..max))
    sum = days.joins(:trips).group(:date).order("count_all").count.values.sum
    total = total = days.joins(:trips).group(:date).order("count_all").count.count
    sum/ total
  end

end
