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
end
