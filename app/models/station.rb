class Station < ActiveRecord::Base
  belongs_to :cities

  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
end
