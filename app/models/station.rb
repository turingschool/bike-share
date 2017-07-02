class Station < ActiveRecord::Base
  belongs_to :city
  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city_id, presence: true
  validates :installation_date, presence: true
end
