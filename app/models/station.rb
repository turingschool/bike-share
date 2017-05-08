class Station < ActiveRecord::Base
  belongs_to :city
  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city_id, presence: true
  validates :installation_date, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  def format_date
    installation_date.strftime('%m/%d/%Y')
  end

  def self.average_bikes
    Station.average(:dock_count)
  end

  def self.most_bikes_count
    Station.maximum(:dock_count)
  end

  def self.most_bikes_avail_at
    Station.where(
                  dock_count: Station.most_bikes_count
                  )
                  .pluck(:name)
                  .join(', ')
  end

  def self.fewest_bikes_count
    Station.minimum(:dock_count)
  end

  def self.fewest_bikes_avail_at
    Station.where(
                  dock_count: Station.fewest_bikes_count
                  ).pluck(:name)
                  .join(', ')
  end

  def self.newest_station
    Station.max_install_date
                  .pluck(:name)
                  .join(', ')
  end

  def self.oldest_station
    Station.min_install_date
                  .pluck(:name)
                  .join(', ')
  end

  def self.max_install_date
    Station.where(installation_date: Station.maximum(:installation_date) )
  end

  def self.min_install_date
    Station.where(installation_date: Station.minimum(:installation_date) )
  end
end
