class Station < ActiveRecord::Base
  validates_presence_of :name, :dock_count, :installation_date, :city_id
  belongs_to :cities

end
