class Station < ActiveRecord::Base
  validates_presence_of :name, :dock_count, :city_id
  belongs_to :cities

end
