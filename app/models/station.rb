class Station < ActiveRecord::Base
  def initialize


  end
  belongs_to :city

	validates :name, presence: true #uniq?
	validates :dock_count, presence: true
	validates :city_id, presence: true
	validates :installation_date, presence: true

  def self.total
    all.count
  end

  def self.avg
    count_array = all.select('dock_count')
    (count_array.inject(0){ |sum, el| sum + el.dock_count }.to_f / count_array.size).round(1)
  end

  def self.most_bikes
    array_by_dock_count = all.max_by {|dock| dock.dock_count}
  end

  def self.least_bikes
    array_by_dock_count = all.min_by {|dock| dock.dock_count}
  end

  def self.newest_station
    array_by_dock_count = all.max_by {|dock| dock.installation_date}
  end

  def self.oldest_station
    array_by_dock_count = all.min_by {|dock| dock.installation_date}
  end
end
