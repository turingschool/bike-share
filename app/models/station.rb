class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city_id, presence: true
  validates :installation_date, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
