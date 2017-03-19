class Station < ActiveRecord::Base

  belongs_to :city

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :lat, presence: true
  validates :long, presence: true

end
