class Station < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true, uniqueness: true
  validates :dock_count, :city_id, :installation_date, presence: true
end