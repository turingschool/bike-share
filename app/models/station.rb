class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :installation_date

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city_id, presence: true
  validates :installation_date_id, presence: true
end
