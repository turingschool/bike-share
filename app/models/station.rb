class Station < ActiveRecord::Base
  validates_presence_of :name, :dock_count, :installation_date
  belongs_to :cities

end
