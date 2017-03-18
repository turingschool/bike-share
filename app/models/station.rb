class Station < ActiveRecord::Base
  belongs_to :city
  has_many :trips
  validates :name, presence: true, uniqueness: true
  validates :dock_count, presence: true
  validates :city_id, presence: true
  validates :installation_date, presence: true

end
