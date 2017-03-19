class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true, uniqueness: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.average_bikes
    average(:dock_count).round
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.stations_by_most_docks
    docks = order(dock_count: :desc)
    derks = docks.group_by {|x| x.dock_count}
    results = derks.max_by {|x| derks.keys}
    results[1].map do |r|
      r.name
    end.join(', ')
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.stations_by_least_docks
    docks = order(:dock_count)
    derks = docks.group_by {|x| x.dock_count}
    results = derks.max_by {|x| derks.keys}
    results[1].map do |r|
      r.name
    end.join(', ')
  end

  def self.stations_by_install_date
    installs = order(installation_date: :desc)
    installs.select do |x|
      x
    end
  end

  def self.newest_station
    stations_by_install_date.first
  end

  def self.oldest_station
    stations_by_install_date.reverse.first

  end
end
