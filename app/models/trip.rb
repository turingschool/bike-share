class Trip < ActiveRecord::Base
  has_many :stations
  belongs_to :trip_date
  belongs_to :trip_time

  validates :duration, :start_date, :end_date, :start_station, :end_station, :bike_id, :subscription_type_id, presence: true

  def self.find_thirty_trips(start_index)
    find_range = (start_index...(start_index + 30)).to_a
    order(:start_date).find(find_range)
  end

  # def self.sort_trips_by_date
  #   order(:trip_date)
  # end
end
