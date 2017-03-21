class Trip < ActiveRecord::Base
  has_many :stations

  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id"

	validates :duration, presence: true
	validates :start_date, presence: true
	validates :start_station, presence: true
	validates :end_date, presence: true
  validates :end_station, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  # def self.total
  #   all.count
  # end

  # def self.avg
  #   count_array = all.select('dock_count')
  #   (count_array.inject(0){ |sum, el| sum + el.dock_count }.to_f / count_array.size).round(1)
  # end

  def self.avg
    self.average(:duration).to_f.round(2)
  end

  def self.longest
    self.maximum(:duration)
  end

  def self.shortest
    self.minimum(:duration)
  end

  def self.most_start
    # station_count = Hash.new(0)
    # self.all.map do |trip|
    #   station_count[trip.start_station_id] += 1
    # end
    # station_count.max_by{ |k, v| v}
    station_count = Hash.new(0)
    Station.ids.each do |id|
      station_count[id] = Trip.where(start_station_id: id).count
    end
    station_count.max_by { |k, v| v}
  end

  def self.most_end
    # station_count = Hash.new(0)
    # self.all.map do |trip|
    #   station_count[trip.end_station_id] += 1
    # end
    # station_count.max_by{ |k, v| v}
    station_count = Hash.new(0)
    Station.ids.each do |id|
      station_count[id] = Trip.where(end_station_id: id).count
    end
    station_count.max_by { |k, v| v}
  end

end
